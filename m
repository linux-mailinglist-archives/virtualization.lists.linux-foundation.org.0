Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE527AECF8
	for <lists.virtualization@lfdr.de>; Tue, 26 Sep 2023 14:37:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2BB24182B;
	Tue, 26 Sep 2023 12:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2BB24182B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tvmIcPEh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hkP_f4Oi_CKQ; Tue, 26 Sep 2023 12:37:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5A6754182D;
	Tue, 26 Sep 2023 12:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A6754182D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CC58C008C;
	Tue, 26 Sep 2023 12:37:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12C7FC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 12:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E19AB41825
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 12:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E19AB41825
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xdG0UQkTPodH
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 12:37:29 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::61f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7CCE7409C8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Sep 2023 12:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CCE7409C8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5AncVwFCzavokn5uRul6RgMNkeuxhIFpTDWuTzqWEG4+FSq9LHf7Kb3UsaK11u//RXn02HRpdehD4H4d7yp1OK1zF9lshWqwgT0/VIRqoc17Hbx2GUEa1q1KF+BTdIXzkpDQtTqWnfsvVqaYBVAwAlP5JBj7VOC1kFXB1HWPJy3N0Lp8ikbaX0cA9uQPP7AaaG+mm7ZaLCBoTgzOfV3fivNrtUvX84rBcGup7bRceHxMphqCAfaXSIS0SCr4YlLxCfDEHhz/rjmCpdkVlYLu2WY9b1LQtPcGyHew178gnh8imoQUp1reN92xUmTvVckEEVTXo5r3NNFQKVfDO8sBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tN2gaySd2CCF/b6FiXN5C+wAZD0UvhLHxgn1KXNU2mE=;
 b=jIWakZUuCtu4WKc1Smq81c+C0j9nHcacnDsYOTJhRMdvLp9UCVKpIgpaOWWYAB9ulqDLoUxRMUR9Q1hUvfpePhrdE8zCDmVnfSSR6vIIKIbTrvLBdNOWXv5+FRmHYswndMQQDKkUNqV+vNo18D5RlIzjnFEqLSU2V9H4+G/KzCAEKmoQq6leJwGO7wRXgp3xMdZbrQv3Q18TbWhp4683H+LSSGy2ST/dhOGfTQdBAf92IqGgMPylOCPWJRq1R2KKo4JsYhjdIMuej0RpSOx58PZAsDGNs4AXUWp8AkEi7DwbhpFBXKapUxQNd+goiT+NMwIEomBW22u5QvdMwmjZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tN2gaySd2CCF/b6FiXN5C+wAZD0UvhLHxgn1KXNU2mE=;
 b=tvmIcPEhy18rYlGIcAa9ebf3ARL20CC3Sv1Cjr02KHforH+AcdHZx4Ib7ueNRaa1PP0l6p3g/W7wUgngR59cYjzDRj29p3NezMbo7FC/5idzX1tQfkYEr/06ZEvJqnesoq11467EhRjaFUtU5eRYE3zbdeBhom5kzxT5PHpKIydy3yyXFyne5Ho2ZIIDhK0+gnsfTX7ITRWcO5XnH1BCOarjfPdx1Nn1lm/gq4P4gXo/hVfGNGp9tgVcalL4cApKf4AM8HWyYkgl0N2II1dxxiCUVMnINgG2mQFeVoFIlkt8IlhUYwmVQfIP6K0D4qMdzMzGayUhJZ7YkLY+hkm7Gg==
Received: from DM6PR12MB5565.namprd12.prod.outlook.com (2603:10b6:5:1b6::13)
 by CH3PR12MB9028.namprd12.prod.outlook.com (2603:10b6:610:123::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 12:37:24 +0000
Received: from DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::fddf:d4b8:44d9:d378]) by DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::fddf:d4b8:44d9:d378%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 12:37:24 +0000
To: "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "si-wei.liu@oracle.com"
 <si-wei.liu@oracle.com>, "jasowang@redhat.com" <jasowang@redhat.com>,
 "eperezma@redhat.com" <eperezma@redhat.com>, Saeed Mahameed
 <saeedm@nvidia.com>, "mst@redhat.com" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/16] vdpa: Add support for vq descriptor mappings
Thread-Topic: [PATCH 00/16] vdpa: Add support for vq descriptor mappings
Thread-Index: AQHZ5XlWwm3ZWo9//EK2iaK4bDf9KbArQYSAgAHbrICAAARCgA==
Date: Tue, 26 Sep 2023 12:37:24 +0000
Message-ID: <cda93fbafff69a773b6d06b212899d05e8703e85.camel@nvidia.com>
References: <20230912130132.561193-1-dtatulea@nvidia.com>
 <d9962b17aebd75b4c32c24437ad68c967f78377d.camel@nvidia.com>
 <79d1b247-ecf9-b636-3581-341515cd68cf@oracle.com>
In-Reply-To: <79d1b247-ecf9-b636-3581-341515cd68cf@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5565:EE_|CH3PR12MB9028:EE_
x-ms-office365-filtering-correlation-id: e3168818-3845-4251-a6d1-08dbbe8d5623
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GujZTx8Fq7SMk7yT/2ptSJMsJnp+GurGPnOHPSNJ2PMvontPUqfNCvTzkrqclmfuuH4Rrq86rWpcgC67ew1p9qISgRGgLnsK/WjQoLyrDBR9hxtL+WzIbPtN65grwgmLAU50cyMVxN541bDLzs0DPpJiMKecNkqc2vBX9+P4tOf7SfBDi5u7PBdr1AG1DWxxHHfuaW3mG8X8t60+elP/gIPDhwlI/nrgbFW6N5nE0OEXmcpwIby4UEddiNH9ikP2zU6/nnjQOaf8BpurGMDiDi+r43qh2qV1QNX/LqYk7LWHvVNkgMOzbZq627ALtMAN9Pl8ng5VaVlNjIAtcEG9W/wulXdp/TPUOQvO2lvl2vv+sBFgOwB87KvXln7YSu94JsSDUgBt8qYED+sKzc9yRpZyJJCqpeFfzPsuUQoOK1k3VHclp4wFWkpkwVzduOmazcvCG3AHlyfpAcX8Xkadg1Zo/ZwJfsgmkL8hdv/DB38bKBtTivqUAjdfjXMou1xzzqqv4lG1/h1aPTjW5Iqb8NP8Lb7r+IDvAwjGamxMk4mEyZHPYRTFPjaIRq3iRZ1P8Cefnqb2JK/A1KuJKEPzVswIojmXc7UWSEiNH6E4RMdHaV4fnRF5Hy4+CgyPuW6e4m4b1mi3KeLuyD3mwOtkwDL8HuFG+amMJGW424fH46Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(230922051799003)(186009)(451199024)(1800799009)(41300700001)(54906003)(316002)(66946007)(66476007)(76116006)(66556008)(66446008)(91956017)(110136005)(64756008)(6512007)(8676002)(8936002)(2906002)(4326008)(478600001)(71200400001)(122000001)(6486002)(83380400001)(5660300002)(38070700005)(38100700002)(6506007)(53546011)(36756003)(2616005)(966005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXRCcjBBZVBMZ2h5ZHBaTWc5VHFpL2Vna0xRVTBIREo2ekdwTzRQajN3Sm96?=
 =?utf-8?B?TjlZY21VTFlMcG1IM2tvVGM0WXR5ODl5amVKeDlya29XNEc0T3JjMElmNE80?=
 =?utf-8?B?Y2wwazFBSkY5cnJnQVkyZm9wckE3bm5RRnptaC94TVhvbUhRTGpBQWI5NGpS?=
 =?utf-8?B?b2VFcHFMVkxkdSsvYnFOWDZLK0lWcjBaODJvT2lvbStWTDBoTUEvN0V3b1Ri?=
 =?utf-8?B?d3ZPZGY3MHhZMmxPNDh3emFmNm5ROU1yUTBFaGxvZTZMaVplOVdWd01PajlB?=
 =?utf-8?B?SG5PRFpuNVRSc2ZRUVlDRlZWQUo2OHdGWnVWOVRUNTFKb2RQSmRCaTBTbGk2?=
 =?utf-8?B?Rnc1OENUU05McmttakVYaElKaUNMbkNBdHE0dDlSTmhpWkZTMytMcTJ6d25i?=
 =?utf-8?B?NW9aTEp6Rk00ZjZPRHZ0anhrMHBtTEdhQ0p6dnEwVS9JUzlJZHkxYWhHMW91?=
 =?utf-8?B?TzkrQjlaSVdWeU5DL0owL1hwaktocDNEbk9UYkVnTWhNQ1RGNzA5VU9xemto?=
 =?utf-8?B?Q29zMmtKUUd6Z1Bhc29RNmVISFZoWXQ5QkZnRlpRWXphL2UwSEZyeVBPclox?=
 =?utf-8?B?dXpueGI3R2lMd0xyMGZHT2J1YUIyKzR0RXFCbkZqWC9XTjVEclpIMjJIMTNj?=
 =?utf-8?B?NlB2czBndTQvdHJLWmVub3NTdVI2NVd6aHRtd0RCTURSREZLVXladkU5ZHAz?=
 =?utf-8?B?TmZYOGtXbS90Vy9ndEdmMWhaL0pSMnBoMUZvQm5uUzlxQ0dtazUxbTNoNDNi?=
 =?utf-8?B?ZytCYktGQnk3aVBQTnRrSWVGcy9sMnhOendXd0tuTTRWNW1xWGVBZEI1Q044?=
 =?utf-8?B?QXZqVmMranl1UnFGdXpsYWxpSGk5Zm1sL0NQdERiK3FZZVFEYittQ0FUVXQ1?=
 =?utf-8?B?OEx5NHAvU2Zkd0dlNHNUTExLSkZWbkQwNkt6Q05TcHppbW9lUktJY2RjQkE0?=
 =?utf-8?B?aWl2Yk94YjI4UHpXdVptVzhIWktUQ1Y4dUd4UjloTDZVVHVRai90TFpKZUc3?=
 =?utf-8?B?YU5qV1JHVmpHandCdWJOcGZKQVY3TDJ3a2VwSGl4aGZFYmpsN3dLQittclpV?=
 =?utf-8?B?NVNTcHpIRVc2azBTTlFrTjBSOUFuUGNhS05Dc2xHV3hJdlpoQmFkTnc3c2No?=
 =?utf-8?B?TjFQTDZ1V2V5dnd1bG9XWlBqTEVERmxqeHd3bzFvUlhnWEpKU09UV2xkK2VK?=
 =?utf-8?B?TjFrWEdqcVlkZ1VkeU92aVA1TjdzVUN5OENub1Bkd0tCMnVsakRMMVdWbDFR?=
 =?utf-8?B?OGFGSERJOVVUR3JqTHQrSTIvd3pkeWt6Wk1tZnFVN292WXowNURXVm9VaXQr?=
 =?utf-8?B?Y1duVXQyTllGbmtqRGF4MVYvbEMwNFZxaFpYWmFGYXBXTXpyazU1U1A3Y1FG?=
 =?utf-8?B?UmNxMDlZTHZyQzRkdkhXa0laNVpNL0xYT3haWFlvbUFJYjdqV1dkdzluUjNV?=
 =?utf-8?B?NUhCb0p2R09XVDBGTVNWZlZIYkRtaUJ5YmFmUVBqWWhMb2h2b3lkeXU1S3BK?=
 =?utf-8?B?NE0vNWwrM0k5K1RISDBGbDBOVmVnVzZ6QmhoUUlodStKVFNBQlRjaFhwaUdN?=
 =?utf-8?B?ZTF6bFBmYkZnQ3BtaWNIdTd4c2FiRXFjcnRVSisweTV5ZGczNmNMVURhS2cz?=
 =?utf-8?B?TTZzNVV4bGtHVWg2N1ZHQUtqOXpiS3ROZHpFTm8zY01KWU40cUNKUDdDOFFL?=
 =?utf-8?B?cTI5UVNNS0MwQTZja2hFRklnZHdEZ1k3Yi9KTFliYXpEcHNpY0pFcEtobkJs?=
 =?utf-8?B?NmM2OTJtZnprN2RyajJzd1pOd2lMUVJwK01wOVlueHlRbzNmVXp0OTRvUnBp?=
 =?utf-8?B?R0J3ck00ZGs2dTJSMnZzckplMzVKTlJMSHlCNVptOGtsMmlNazNsUFN5c3dD?=
 =?utf-8?B?VWk4V25LZDRkdzlvRzJzRlRBWDVaRTI1R0l6N3JqTndUaVA5Tm13aWdsUVRL?=
 =?utf-8?B?UCtUbXNwaFRvTW4vMVd2dU4vQk1yeHIzNmJHcnNvT0RzeUwwV0NUeTdESzFM?=
 =?utf-8?B?czdMQnJDdWd1TGZvWlpNektSbTc0UHdmQ2pXaUNPZU1PNXRuRDM5cHA1WlB2?=
 =?utf-8?B?TlB0N3J2OWxOWXY1QU5TQ2hDdFNaUnZBUFM3MWxhVGljcFQvOC91Tk0vcEJo?=
 =?utf-8?B?enl6K05xSWJqeDU1Y3hTWkdOTFhGUjNaTkNBK0NTZXBpcEZGTkZycEJ0bUth?=
 =?utf-8?Q?Y8Sd7wnWp2eIU/BbS+cahuMBf66BclOfh0GoxarfKBjj?=
Content-ID: <624F86F886300E4FAD45443597A9E97B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3168818-3845-4251-a6d1-08dbbe8d5623
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 12:37:24.7332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9IV18cK/nR93LXgBwufV3ZGzhSM/AP8lgmg/o0+ywSp481NDWHXT92QnUsWt+QkMOXJF5mNlfleqVCVIxSc5pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9028
Cc: "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
From: Dragos Tatulea via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gVHVlLCAyMDIzLTA5LTI2IGF0IDA1OjIyIC0wNzAwLCBTaS1XZWkgTGl1IHdyb3RlOg0KPiAN
Cj4gDQo+IE9uIDkvMjUvMjAyMyAxMjo1OSBBTSwgRHJhZ29zIFRhdHVsZWEgd3JvdGU6DQo+ID4g
T24gVHVlLCAyMDIzLTA5LTEyIGF0IDE2OjAxICswMzAwLCBEcmFnb3MgVGF0dWxlYSB3cm90ZToN
Cj4gPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdnEgZGVzY3JpcHRvciB0
YWJsZSBtYXBwaW5ncyB3aGljaA0KPiA+ID4gYXJlIHVzZWQgdG8gaW1wcm92ZSB2ZHBhIGxpdmUg
bWlncmF0aW9uIGRvd250aW1lLiBUaGUgaW1wcm92ZW1lbnQgY29tZXMNCj4gPiA+IGZyb20gdXNp
bmcgc21hbGxlciBtYXBwaW5ncyB3aGljaCB0YWtlIGxlc3MgdGltZSB0byBjcmVhdGUgYW5kIGRl
c3Ryb3kNCj4gPiA+IGluIGh3Lg0KPiA+ID4gDQo+ID4gR2VudGxlIHBpbmcuDQo+ID4gDQo+ID4g
Tm90ZSB0aGF0IEkgd2lsbCBoYXZlIHRvIHNlbmQgYSB2Mi4gVGhlIGNoYW5nZXMgaW4gbWx4NV9p
ZmMuaCB3aWxsIG5lZWQgdG8NCj4gPiBiZQ0KPiA+IG1lcmdlZCBmaXJzdCBzZXBhcmF0ZWx5IGlu
dG8gdGhlIG1seDUtbmV4dCBicmFuY2ggWzBdIGFuZCB0aGVuIHB1bGxlZCBmcm9tDQo+ID4gdGhl
cmUNCj4gPiB3aGVuIHRoZSBzZXJpZXMgaXMgYXBwbGllZC4NCj4gVGhpcyBzZXBhcmF0aW9uIGlz
IHVubmVjZXNzYXJ5LCBhcyBoaXN0b3JpY2FsbHkgdGhlIHZpcnRpbyBlbXVsYXRpb24gDQo+IHBv
cnRpb24gb2YgdGhlIHVwZGF0ZSB0byBtbHg1X2lmYy5oIG9mdGVuIGhhZCB0byBnbyB0aHJvdWdo
IHRoZSB2aG9zdCANCj4gdHJlZS4gU2VlIGNvbW1pdHMgMTg5MmEzZDQyNWJmIGFuZCBlMTNjZDQ1
ZDM1MmQuIEVzcGVjaWFsbHkgdGhlIA0KPiBhZGRpdGlvbnMgZnJvbSB0aGlzIHNlcmllcyAobWFp
bmx5IGRlc2MgZ3JvdXAgbWtleSkgaGF2ZSBub3RoaW5nIHRvIGRvIA0KPiB3aXRoIGFueSBuZXR3
b3JraW5nIG9yIE5JQyBkcml2ZXIgZmVhdHVyZS4NCj4gDQpUaGUgcmVhc29uIGZvciBkb2luZyB0
aGF0IGlzIHRvIGF2b2lkIGNvbmZsaWN0cyBpbiBMaW51cydzIHRyZWUgb24gdGhlDQptbHg1X2lm
Yy5oIGZpbGUuDQoNClRoYW5rcywNCkRyYWdvcw0KDQo+IC1TaXdlaQ0KPiANCj4gPiANCj4gPiBb
MF0NCj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9t
ZWxsYW5veC9saW51eC5naXQvbG9nLz9oPW1seDUtbmV4dA0KPiA+IA0KPiA+IFRoYW5rcywNCj4g
PiBEcmFnb3MNCj4gPiANCj4gPiA+IFRoZSBmaXJzdCBwYXJ0IGFkZHMgdGhlIHZkcGEgY29yZSBj
aGFuZ2VzIGZyb20gU2ktV2VpIFswXS4NCj4gPiA+IA0KPiA+ID4gVGhlIHNlY29uZCBwYXJ0IGFk
ZHMgc3VwcG9ydCBpbiBtbHg1X3ZkcGE6DQo+ID4gPiAtIFJlZmFjdG9yIHRoZSBtciBjb2RlIHRv
IGJlIGFibGUgdG8gY2xlYW5seSBhZGQgZGVzY3JpcHRvciBtYXBwaW5ncy4NCj4gPiA+IC0gQWRk
IGhhcmR3YXJlIGRlc2NyaXB0b3IgbXIgc3VwcG9ydC4NCj4gPiA+IC0gUHJvcGVybHkgdXBkYXRl
IGlvdGxiIGZvciBjdnEgZHVyaW5nIEFTSUQgc3dpdGNoLg0KPiA+ID4gDQo+ID4gPiBbMF0NCj4g
PiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3ZpcnR1YWxpemF0aW9uLzE2OTQyNDg5NTktMTMz
NjktMS1naXQtc2VuZC1lbWFpbC1zaS13ZWkubGl1QG9yYWNsZS5jb20NCj4gPiA+IA0KPiA+ID4g
RHJhZ29zIFRhdHVsZWEgKDEzKToNCj4gPiA+IMKgwqAgdmRwYS9tbHg1OiBDcmVhdGUgaGVscGVy
IGZ1bmN0aW9uIGZvciBkbWEgbWFwcGluZ3MNCj4gPiA+IMKgwqAgdmRwYS9tbHg1OiBEZWNvdXBs
ZSBjdnEgaW90bGIgaGFuZGxpbmcgZnJvbSBodyBtYXBwaW5nIGNvZGUNCj4gPiA+IMKgwqAgdmRw
YS9tbHg1OiBUYWtlIGN2cSBpb3RsYiBsb2NrIGR1cmluZyByZWZyZXNoDQo+ID4gPiDCoMKgIHZk
cGEvbWx4NTogQ29sbGFwc2UgImR2cSIgbXIgYWRkL2RlbGV0ZSBmdW5jdGlvbnMNCj4gPiA+IMKg
wqAgdmRwYS9tbHg1OiBSZW5hbWUgbXIgZGVzdHJveSBmdW5jdGlvbnMNCj4gPiA+IMKgwqAgdmRw
YS9tbHg1OiBBbGxvdyBjcmVhdGlvbi9kZWxldGlvbiBvZiBhbnkgZ2l2ZW4gbXIgc3RydWN0DQo+
ID4gPiDCoMKgIHZkcGEvbWx4NTogTW92ZSBtciBtdXRleCBvdXQgb2YgbXIgc3RydWN0DQo+ID4g
PiDCoMKgIHZkcGEvbWx4NTogSW1wcm92ZSBtciB1cGRhdGUgZmxvdw0KPiA+ID4gwqDCoCB2ZHBh
L21seDU6IEludHJvZHVjZSBtciBmb3IgdnEgZGVzY3JpcHRvcg0KPiA+ID4gwqDCoCB2ZHBhL21s
eDU6IEVuYWJsZSBodyBzdXBwb3J0IGZvciB2cSBkZXNjcmlwdG9yIG1hcHBpbmcNCj4gPiA+IMKg
wqAgdmRwYS9tbHg1OiBNYWtlIGlvdGxiIGhlbHBlciBmdW5jdGlvbnMgbW9yZSBnZW5lcmljDQo+
ID4gPiDCoMKgIHZkcGEvbWx4NTogVXBkYXRlIGN2cSBpb3RsYiBtYXBwaW5nIG9uIEFTSUQgY2hh
bmdlDQo+ID4gPiDCoMKgIENvdmVyIGxldHRlcjogdmRwYS9tbHg1OiBBZGQgc3VwcG9ydCBmb3Ig
dnEgZGVzY3JpcHRvciBtYXBwaW5ncw0KPiA+ID4gDQo+ID4gPiBTaS1XZWkgTGl1ICgzKToNCj4g
PiA+IMKgwqAgdmRwYTogaW50cm9kdWNlIGRlZGljYXRlZCBkZXNjcmlwdG9yIGdyb3VwIGZvciB2
aXJ0cXVldWUNCj4gPiA+IMKgwqAgdmhvc3QtdmRwYTogaW50cm9kdWNlIGRlc2NyaXB0b3IgZ3Jv
dXAgYmFja2VuZCBmZWF0dXJlDQo+ID4gPiDCoMKgIHZob3N0LXZkcGE6IHVBUEkgdG8gZ2V0IGRl
ZGljYXRlZCBkZXNjcmlwdG9yIGdyb3VwIGlkDQo+ID4gPiANCj4gPiA+IMKgwqBkcml2ZXJzL3Zk
cGEvbWx4NS9jb3JlL21seDVfdmRwYS5oIHzCoCAzMSArKystLQ0KPiA+ID4gwqDCoGRyaXZlcnMv
dmRwYS9tbHg1L2NvcmUvbXIuY8KgwqDCoMKgwqDCoMKgIHwgMTkxICsrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tDQo+ID4gPiDCoMKgZHJpdmVycy92ZHBhL21seDUvY29yZS9yZXNvdXJjZXMu
YyB8wqDCoCA2ICstDQo+ID4gPiDCoMKgZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5j
wqAgfCAxMDAgKysrKysrKysrKy0tLS0tDQo+ID4gPiDCoMKgZHJpdmVycy92aG9zdC92ZHBhLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyNyArKysrDQo+ID4gPiDCoMKgaW5jbHVk
ZS9saW51eC9tbHg1L21seDVfaWZjLmjCoMKgwqDCoMKgIHzCoMKgIDggKy0NCj4gPiA+IMKgwqBp
bmNsdWRlL2xpbnV4L21seDUvbWx4NV9pZmNfdmRwYS5oIHzCoMKgIDcgKy0NCj4gPiA+IMKgwqBp
bmNsdWRlL2xpbnV4L3ZkcGEuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDExICsr
DQo+ID4gPiDCoMKgaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0LmjCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDggKysNCj4gPiA+IMKgwqBpbmNsdWRlL3VhcGkvbGludXgvdmhvc3RfdHlwZXMuaMKgwqAg
fMKgwqAgNSArDQo+ID4gPiDCoMKgMTAgZmlsZXMgY2hhbmdlZCwgMjY0IGluc2VydGlvbnMoKyks
IDEzMCBkZWxldGlvbnMoLSkNCj4gPiA+IA0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
