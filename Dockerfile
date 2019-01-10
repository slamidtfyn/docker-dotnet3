FROM microsoft/dotnet:3.0-runtime as runtime

WORKDIR /app

FROM microsoft/dotnet:3.0-sdk as build

WORKDIR /src

COPY ./app/app.csproj ./ 

RUN dotnet restore app.csproj

COPY ./app/ .

RUN dotnet build app.csproj -o /app

FROM runtime as final

COPY --from=build /app .

ENTRYPOINT ["dotnet", "app.dll"]




