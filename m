Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 065997AD349
	for <lists.virtualization@lfdr.de>; Mon, 25 Sep 2023 10:26:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBD74418F4;
	Mon, 25 Sep 2023 08:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBD74418F4
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pe3OiU6k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iqT6tU5yGEWq; Mon, 25 Sep 2023 08:26:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2334D418E2;
	Mon, 25 Sep 2023 08:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2334D418E2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40253C008C;
	Mon, 25 Sep 2023 08:26:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47D9FC0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Sep 2023 08:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D62260B58
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Sep 2023 08:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D62260B58
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=pe3OiU6k
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dpg0xZBpuKh1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Sep 2023 08:26:38 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::621])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C556C60A99
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Sep 2023 08:26:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C556C60A99
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjHgPYenngTOnq6w9rMq1RFicxUvln5FIYo1Y/SJHoKfXMgy0Lht157sDkz/o3t8FMMhvcU8yzfX/xReGO8olz1UwvE1BzTLQOpSqiBVPIlJnwMdX/t0VToZqebLYfrZu48bchd51VD4nD9nXJEkg8UXF1r5P8tT0Ha951OQ31DXbQWokxj0v8LdriqYx7Nu8tzc0z+AvhaGfvxusUOp46r2Kzxc0nIcqiVkD75uc7sunSAiB/kBfCDqg/ZG6hWjkM0NLGsPdP+xtGUrwuinLPDmVzdxWgsDmR3K9bhROS3j8MyMSH/y++KfOydCNCJJsgi4bpAqq45UA6qPcFDOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aorSk4mKwumR7sDGU2O/86ptRLy0pQ1FphFtlHIIfnw=;
 b=U12Z6LYCdH37j2rVlBjo7AzkHfGpMCjsu1kV1losJq0DYkkuVodtNYpAWsCo6Pv42YIpsluRPtncJfnKYmsz2qnHc0CJ2WPHzgUAf6OJO2/QPlUF6CZ19h/cC5kzxMRSBW8zu60Wj3VgJmhob7nIBylIoVHkrmhgMC2njK+ivjV0WOJJabd6uHP6J2wFye9ue1wod8YOhnBuz9OyrZM8r69pFVD/zrs8SqsV1nW2H433KhQ2so6pUOUZWkS5kSXdfgHmZHdcGXqKEJ1/YWItE4txJzpr9St4IcrkYY2MCuMkjmtnyZnE7tT0hGW9HuZSSLo2TpdHyR/2GwyDD08Pmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aorSk4mKwumR7sDGU2O/86ptRLy0pQ1FphFtlHIIfnw=;
 b=pe3OiU6kH/S2WPj1ifFL4TnV6ro5T5dhRrAaZTFPlgthKFAEWbduSJTeNsWmbc8xulrFl6IbKyL0gKNKZgW7Ysea/E9DYps/d++OtacZ/6QC+ZlnbrLwtZutCO7QMTtpc2jkWCOPar/9M6waT2LCKVm1C99DTKaufelKpx4J9a6DiYpNisViHz/O3KAC/yRbQoSyzMM4CRZ+OTHSxB0YCkudX8V+0psjh3C1zq0DnFwaOZqSzFwi61gImB1l/qz1qoDAhRiBK6bwL4kKfjnwe+jAc8M0xPnXKtKGcntbTG4Fv7wlRZWCSH3vilZ8zc1lCcKEGNSP6Eein+Ci8RKKnw==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by BL1PR12MB5970.namprd12.prod.outlook.com (2603:10b6:208:399::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Mon, 25 Sep
 2023 08:26:34 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::4002:4762:330c:a199]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::4002:4762:330c:a199%7]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 08:26:33 +0000
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH vfio 11/11] vfio/virtio: Introduce a vfio driver over
 virtio devices
Thread-Topic: [PATCH vfio 11/11] vfio/virtio: Introduce a vfio driver over
 virtio devices
Thread-Index: AQHZ7IkPl5ENqOgMC0yEzkOHANq/CLAlfIYAgAACZQCAAAJ1AIAAAaqAgAAD/QCAAAaKAIAAAwkAgAAF2ICAABWjgIAABYGAgAAGVYCAAHFrgIAAnJQAgAAAJ7CABBFQgIAAYeqA
Date: Mon, 25 Sep 2023 08:26:33 +0000
Message-ID: <PH0PR12MB5481ED78F7467EEB0740847EDCFCA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230921125348-mutt-send-email-mst@kernel.org>
 <20230921170709.GS13733@nvidia.com>
 <20230921131035-mutt-send-email-mst@kernel.org>
 <20230921174450.GT13733@nvidia.com>
 <20230921135426-mutt-send-email-mst@kernel.org>
 <20230921181637.GU13733@nvidia.com>
 <20230921152802-mutt-send-email-mst@kernel.org>
 <20230921195345.GZ13733@nvidia.com>
 <20230921155834-mutt-send-email-mst@kernel.org>
 <CACGkMEvD+cTyRtax7_7TBNECQcGPcsziK+jCBgZcLJuETbyjYw@mail.gmail.com>
 <20230922122246.GN13733@nvidia.com>
 <PH0PR12MB548127753F25C45B7EFF203DDCFFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuX5HJVBOw9E+skr=K=QzH3oyHK8gk-r0hAvi6Wm7OA7Q@mail.gmail.com>
In-Reply-To: <CACGkMEuX5HJVBOw9E+skr=K=QzH3oyHK8gk-r0hAvi6Wm7OA7Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|BL1PR12MB5970:EE_
x-ms-office365-filtering-correlation-id: b70e82e6-9a12-4888-1ff4-08dbbda1208b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J5t0WbXsPJasxjT4rWdgLtWe+sLNqjEiHHH/cxMrYUE3IDD7zlyM9YrV8YtAvcCO9s2QJrVHNot/h2YtK3ppDcsPO7hmwbNOOfHl1MDj0b/mFmX/4lXQICQEF+AGQNE3RVSEzg6c7TTa5TfYPZKEDqWFGM2qRe/HJ7xgT4U/ae/EQJ9Ek0tiEHTLSPuM95n0rRW27wJFDugrpniwUtJGwHrwnOcFeE67nreoAlA3wnXRstY6vicDkFYNH17b4Rc7chpzxXSDNlDKMZHOljz1wUbGCRhnl1XXGyz1+1wxpaPBZB0Wx065r33r/+CX1yNwKiGN64+xgorQOcELRP3lqwSbX74MBGMZ3hnY4qjUHJUWrLEzK+DUWwdB31D+AcZEBAcA5V9JtDCWgaJZbnYNp8KO1f8nu1S/+Oc2F4UxFkOZ2b9WkOk6POO7hKfYAWooINfBqgMH/znTAy5cpvJAh6PzEUCqTcg76z1YXnf6GEazaMKf3XTqdczmKeGkDqP+6lhv4huYf67MXs2rW8qJXqHQFoU70+y7aJqupeEikyoxlikUk4WLMjmLhrF6c/Xbu39wJ+cIoAkzEDGRa+IZQJVY/NynNRTCaLnNm5CKPXCFyi0euBXobbudNh4rceBwbR8zptEEjhs/X6JGDUdeG340zfBWLKHQQieh6rmJwBo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(376002)(396003)(136003)(230922051799003)(186009)(451199024)(1800799009)(53546011)(316002)(66556008)(54906003)(6916009)(64756008)(66476007)(8676002)(8936002)(9686003)(107886003)(41300700001)(966005)(83380400001)(7696005)(71200400001)(122000001)(478600001)(38070700005)(38100700002)(55236004)(86362001)(33656002)(66946007)(6506007)(4326008)(66446008)(76116006)(26005)(55016003)(52536014)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rk5SemNSWjZmZVowbXBpdndVL1B3UXh3R1FPQ2lRV3QzTjVDT0FkeFVGOTRw?=
 =?utf-8?B?QTgvRTdzZ1BmUkF2WHhBcHIxNllqOW5vK1ZFU3g0dkRlNVJMYk1IZlVJNTV2?=
 =?utf-8?B?bVc5VTlrVFhpdWV6VXdwRGxlai9QUjBoRGRmTzFYWU5aNWVBSjhXeUlMRGFI?=
 =?utf-8?B?TXMzaFpEczhjOHliR1NmNHI0dXNtWDlVYkF0TTdId0xxQnVzb3lxNGNEMGNW?=
 =?utf-8?B?ckF6TFVoZXV3UXFmN3NuOXZFOXR3TWtNUUlrZUxqaFZpakJzd3FucUV0SnVq?=
 =?utf-8?B?MXgwbThueFNkUDBpQjd3NVpRWit6L3EydW5EVjQ4dXR5Rk1IbWJINGhpZmUv?=
 =?utf-8?B?ckFRSjV0UVFGNmZ2aThic1dWbDQvMElkcnhQdkZ4VUV0SWhSYUpoOXQ2UUNw?=
 =?utf-8?B?aXlOVXZPWE5FSWlYbFZ3dkxyQjlMa0JxQkFPUXZ0Vm01SGlOdXhnTXJxNmo2?=
 =?utf-8?B?UHphSHNDMmUxWE5Ic1RoMXY0OERXbjRvckhkdG1mRmpFU1hFSWcyTysyN3Fo?=
 =?utf-8?B?VkQ1SExtdHF0dzNVdVFUL0NXRGNsandGNjd0UkdMSEtPdzYxczJMejhLeXJN?=
 =?utf-8?B?RTNGcU93cmp3aGlaQlRaZ3k3cUptNEZ4K1B0b2NRbHU5MWhaNURVNlBrVzZW?=
 =?utf-8?B?RmtTT1Q3T2pvSDA3M1dkTmNRT1hRRjBvZE1wcjhFMGFZOHRqYnYvcjBQaWlj?=
 =?utf-8?B?SGtwVXBKaTBxNE9qQlBFdDJJdjl1K0tDeGkxYUljK3RhYzdoZCs5WG1NbWl6?=
 =?utf-8?B?SDdZc1lUQlFYa0xtQVdKMmxWU202bVUzQnIvNkFLZS95QnpGVGVHU0poOFpK?=
 =?utf-8?B?QUNqTFRRcWxLRUw0dEVYTmx3M1ZBd1M4aHZoMmFRSm1vNUxSOHIrVmZER3pt?=
 =?utf-8?B?MlpPTFRXSTRYMnpUdWlIYnJtcDNvNE1UKzN5bkE2cHl3S3BrR1VHQTA5NGhG?=
 =?utf-8?B?eHpLMTBvRnJkdEdHeVltVUZLTEd4aVFVZllmK3NFaDJKanRNQzBXc2U2bWNk?=
 =?utf-8?B?R1FhbjA5aE9DMEhmakZDQ3RVeTF1cEJ1Mnl2SHFIcUZMYkZxcEcrQlBEdTRE?=
 =?utf-8?B?UlZzVXF2WTlJZWIvNDk2ZVdzaFZJUjViTW1QNVZqU1V6UktnYWt3a3NQdy9H?=
 =?utf-8?B?WW11ZDRxb1BLOFFNV1Y0eFZ0Yi9CODFsZDIrbEJVblpwSHJPc3E3R3NjRGNs?=
 =?utf-8?B?bEEyd1NlcVJROVJaR2RBMll6TkxLbktLN2RDV0pwTk5Qa1VrR0NMYWZPVWti?=
 =?utf-8?B?TENTbU54cE9SaGtEamNvaFJjbkV0RENWV2FsWGQwSmpjZCtJa1p0ZDFlak1G?=
 =?utf-8?B?Ukl1RTNFeDN5d3B6V1Y1SXFLQUlJWVZsa2x5bE5wYUlESGFqMDdKR1ppR2Fp?=
 =?utf-8?B?VzNCSEVrOG94SC9yR1gxNkVXTGV6ZG0wbjJvTWZoeDZtb2lzWkxveXpPeE0w?=
 =?utf-8?B?bHdWclp6dkNXa2piOThSSS9sTXowWVRBbUlqNVdBRWVRdE5YY29wbmU5aExI?=
 =?utf-8?B?dUtrdWp5RUdKcmFZOEw4TkZqdXRsaVkxU1BHVXNUWE5kRnByVDhmMGhUT0VH?=
 =?utf-8?B?YVZBZlg4VlloSTRmMDI3OW9oa0VqSjk5SDZHZ3FiZkc5emhaVnowcnhwWGpj?=
 =?utf-8?B?TUVzVjgvYWJtdnd6bjFXREE5TEN4YWpXemJMTFgzSzF4R20rcVVOOTJEMWM4?=
 =?utf-8?B?Y1NkY0VmbXNIOW1LWVQ0dnVWZ1lGWFlYd3E0dFYxT09Wejk4cGoxWG5lczhj?=
 =?utf-8?B?UHRPS09zMVZDaDBscGc1UldQUVpjeU85cHpkVGorVkpFY2lRcnZ6YTUvRlpY?=
 =?utf-8?B?MERvSnpZTFRlRFpDS0N3ZHZwTTdoTytrdHJxYmF4WmtlTjBZUXQwbU1aR29v?=
 =?utf-8?B?ZC9ybHFEUkh5RVBxTmIwaTRtOVJPNkNKemxFTWxEd3VGQXpkZEtUMlQ4RC9i?=
 =?utf-8?B?eFFRWGRjVjMwYzlkZnpvMVQyMmtpNTJSUnU4ZjNlWDJtNVBEb2VyYnN4c0R4?=
 =?utf-8?B?RFV0RExIRjI4N01tUEpWczl4aEtWck0yRUg0N3JpS1JtVUVPWU1hbmlhN0ZJ?=
 =?utf-8?B?NDNYMGwrbHEzcHM5eS9Xd0E3WDJaaFRlVU8rWWoyUFBiV3ppQ29OUFhOb2RF?=
 =?utf-8?Q?T2lg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70e82e6-9a12-4888-1ff4-08dbbda1208b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 08:26:33.6141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FA6gxLoQg1JuMewI7FOnS2lubGTKijLQSok3pFxnnepvZeYAcx2dWoUvIMZYzGr/xR+MMwcqUKmTp/bgAvbmZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5970
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Maor Gottlieb <maorg@nvidia.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiri Pirko <jiri@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
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
From: Parav Pandit via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Parav Pandit <parav@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

DQoNCj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogTW9u
ZGF5LCBTZXB0ZW1iZXIgMjUsIDIwMjMgODowMCBBTQ0KPiANCj4gT24gRnJpLCBTZXAgMjIsIDIw
MjMgYXQgODoyNeKAr1BNIFBhcmF2IFBhbmRpdCA8cGFyYXZAbnZpZGlhLmNvbT4gd3JvdGU6DQo+
ID4NCj4gPg0KPiA+ID4gRnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNvbT4NCj4g
PiA+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVyIDIyLCAyMDIzIDU6NTMgUE0NCj4gPg0KPiA+DQo+
ID4gPiA+IEFuZCB3aGF0J3MgbW9yZSwgdXNpbmcgTU1JTyBCQVIwIHRoZW4gaXQgY2FuIHdvcmsg
Zm9yIGxlZ2FjeS4NCj4gPiA+DQo+ID4gPiBPaD8gSG93PyBPdXIgdGVhbSBkaWRuJ3QgdGhpbmsg
c28uDQo+ID4NCj4gPiBJdCBkb2VzIG5vdC4gSXQgd2FzIGFscmVhZHkgZGlzY3Vzc2VkLg0KPiA+
IFRoZSBkZXZpY2UgcmVzZXQgaW4gbGVnYWN5IGlzIG5vdCBzeW5jaHJvbm91cy4NCj4gDQo+IEhv
dyBkbyB5b3Uga25vdyB0aGlzPw0KPg0KTm90IHN1cmUgdGhlIG1vdGl2YXRpb24gb2Ygc2FtZSBk
aXNjdXNzaW9uIGRvbmUgaW4gdGhlIE9BU0lTIHdpdGggeW91IGFuZCBvdGhlcnMgaW4gcGFzdC4N
Cg0KQW55d2F5cywgcGxlYXNlIGZpbmQgdGhlIGFuc3dlciBiZWxvdy4NCg0KQWJvdXQgcmVzZXQs
DQpUaGUgbGVnYWN5IGRldmljZSBzcGVjaWZpY2F0aW9uIGhhcyBub3QgZW5mb3JjZWQgYmVsb3cg
Y2l0ZWQgMS4wIGRyaXZlciByZXF1aXJlbWVudCBvZiAxLjAuDQoNCiJUaGUgZHJpdmVyIFNIT1VM
RCBjb25zaWRlciBhIGRyaXZlci1pbml0aWF0ZWQgcmVzZXQgY29tcGxldGUgd2hlbiBpdCByZWFk
cyBkZXZpY2Ugc3RhdHVzIGFzIDAuIg0KIA0KWzFdIGh0dHBzOi8vb3psYWJzLm9yZy9+cnVzdHkv
dmlydGlvLXNwZWMvdmlydGlvLTAuOS41LnBkZg0KDQo+ID4gVGhlIGRyaXZlcnMgZG8gbm90IHdh
aXQgZm9yIHJlc2V0IHRvIGNvbXBsZXRlOyBpdCB3YXMgd3JpdHRlbiBmb3IgdGhlIHN3DQo+IGJh
Y2tlbmQuDQo+IA0KPiBEbyB5b3Ugc2VlIHRoZXJlJ3MgYSBmbHVzaCBhZnRlciByZXNldCBpbiB0
aGUgbGVnYWN5IGRyaXZlcj8NCj4gDQpZZXMuIGl0IG9ubHkgZmx1c2hlcyB0aGUgd3JpdGUgYnkg
cmVhZGluZyBpdC4gVGhlIGRyaXZlciBkb2VzIG5vdCBnZXQgX3dhaXRfIGZvciB0aGUgcmVzZXQg
dG8gY29tcGxldGUgd2l0aGluIHRoZSBkZXZpY2UgbGlrZSBhYm92ZS4NCg0KUGxlYXNlIHNlZSB0
aGUgcmVzZXQgZmxvdyBvZiAxLnggZGV2aWNlIGFzIGJlbG93Lg0KSW4gZmFjdCB0aGUgY29tbWVu
dCBvZiB0aGUgMS54IGRldmljZSBhbHNvIG5lZWRzIHRvIGJlIHVwZGF0ZWQgdG8gaW5kaWNhdGUg
dGhhdCBkcml2ZXIgbmVlZCB0byB3YWl0IGZvciB0aGUgZGV2aWNlIHRvIGZpbmlzaCB0aGUgcmVz
ZXQuDQpJIHdpbGwgc2VuZCBzZXBhcmF0ZSBwYXRjaCBmb3IgaW1wcm92aW5nIHRoaXMgY29tbWVu
dCBvZiB2cF9yZXNldCgpIHRvIG1hdGNoIHRoZSBzcGVjLg0KDQpzdGF0aWMgdm9pZCB2cF9yZXNl
dChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikNCnsNCiAgICAgICAgc3RydWN0IHZpcnRpb19w
Y2lfZGV2aWNlICp2cF9kZXYgPSB0b192cF9kZXZpY2UodmRldik7DQogICAgICAgIHN0cnVjdCB2
aXJ0aW9fcGNpX21vZGVybl9kZXZpY2UgKm1kZXYgPSAmdnBfZGV2LT5tZGV2Ow0KDQogICAgICAg
IC8qIDAgc3RhdHVzIG1lYW5zIGEgcmVzZXQuICovDQogICAgICAgIHZwX21vZGVybl9zZXRfc3Rh
dHVzKG1kZXYsIDApOw0KICAgICAgICAvKiBBZnRlciB3cml0aW5nIDAgdG8gZGV2aWNlX3N0YXR1
cywgdGhlIGRyaXZlciBNVVNUIHdhaXQgZm9yIGEgcmVhZCBvZg0KICAgICAgICAgKiBkZXZpY2Vf
c3RhdHVzIHRvIHJldHVybiAwIGJlZm9yZSByZWluaXRpYWxpemluZyB0aGUgZGV2aWNlLg0KICAg
ICAgICAgKiBUaGlzIHdpbGwgZmx1c2ggb3V0IHRoZSBzdGF0dXMgd3JpdGUsIGFuZCBmbHVzaCBp
biBkZXZpY2Ugd3JpdGVzLA0KICAgICAgICAgKiBpbmNsdWRpbmcgTVNJLVggaW50ZXJydXB0cywg
aWYgYW55Lg0KICAgICAgICAgKi8NCiAgICAgICAgd2hpbGUgKHZwX21vZGVybl9nZXRfc3RhdHVz
KG1kZXYpKQ0KICAgICAgICAgICAgICAgIG1zbGVlcCgxKTsNCiAgICAgICAgLyogRmx1c2ggcGVu
ZGluZyBWUS9jb25maWd1cmF0aW9uIGNhbGxiYWNrcy4gKi8NCiAgICAgICAgdnBfc3luY2hyb25p
emVfdmVjdG9ycyh2ZGV2KTsNCn0NCg0KDQo+IHN0YXRpYyB2b2lkIHZwX3Jlc2V0KHN0cnVjdCB2
aXJ0aW9fZGV2aWNlICp2ZGV2KSB7DQo+ICAgICAgICAgc3RydWN0IHZpcnRpb19wY2lfZGV2aWNl
ICp2cF9kZXYgPSB0b192cF9kZXZpY2UodmRldik7DQo+ICAgICAgICAgLyogMCBzdGF0dXMgbWVh
bnMgYSByZXNldC4gKi8NCj4gICAgICAgICB2cF9sZWdhY3lfc2V0X3N0YXR1cygmdnBfZGV2LT5s
ZGV2LCAwKTsNCj4gICAgICAgICAvKiBGbHVzaCBvdXQgdGhlIHN0YXR1cyB3cml0ZSwgYW5kIGZs
dXNoIGluIGRldmljZSB3cml0ZXMsDQo+ICAgICAgICAgICogaW5jbHVkaW5nIE1TaS1YIGludGVy
cnVwdHMsIGlmIGFueS4gKi8NCj4gICAgICAgICB2cF9sZWdhY3lfZ2V0X3N0YXR1cygmdnBfZGV2
LT5sZGV2KTsNCj4gICAgICAgICAvKiBGbHVzaCBwZW5kaW5nIFZRL2NvbmZpZ3VyYXRpb24gY2Fs
bGJhY2tzLiAqLw0KPiAgICAgICAgIHZwX3N5bmNocm9uaXplX3ZlY3RvcnModmRldik7DQo+IH0N
Cj4gDQo+IFRoYW5rcw0KPiANCj4gDQo+IA0KPiA+IEhlbmNlIE1NSU8gQkFSMCBpcyBub3QgdGhl
IGJlc3Qgb3B0aW9uIGluIHJlYWwgaW1wbGVtZW50YXRpb25zLg0KPiA+DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
