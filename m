Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0615932B6
	for <lists.virtualization@lfdr.de>; Mon, 15 Aug 2022 18:05:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F68A82778;
	Mon, 15 Aug 2022 16:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F68A82778
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256 header.s=selector2 header.b=uFiQwGTu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NqZmMzN72XYE; Mon, 15 Aug 2022 16:05:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D64B8827A8;
	Mon, 15 Aug 2022 16:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D64B8827A8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00D6AC0078;
	Mon, 15 Aug 2022 16:05:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2CDAC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 16:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A424405E7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 16:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A424405E7
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=vmware.com header.i=@vmware.com header.a=rsa-sha256
 header.s=selector2 header.b=uFiQwGTu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IHCeiq2zz78u
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 16:05:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B58E4051E
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eastusazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c100::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B58E4051E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Aug 2022 16:05:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPhnxR+b5fR+sMpU8WqOaQhVB2Ml07XQzoJ4dZErqDHzYU8GtJCDOcx5sStQjFZRGdECBDY2CBODfuvE698UlK/Yb4VyT7jp3rxhW5/Fn3LyBcaQtn5oOTw5gjjCyfzZgFA6TUIIbklS3HeOir5arHl7kV8oOB8yKAxtgr131d1Pf1gETp/1LOkX4xSVaHNxM3Io+uTh7GQCgAOeTpzLLquo6F6ckXWIZ9BVlZSnxuAKhiW5fuR/saAteGlcig21R1c6jgBO9Y++oL0n7larxiKAUVoLASL1wRLpFvwAzLJA8LIAFO6VdGybPRVNB3n9hAWLGmjYwPbzjrWatCW3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHiD8hMsd4H/SOCS2+uDAb8MqlHZUDkmHIMRFsR/TzU=;
 b=dGMQLAp7IisVun17DdF2pbMD+ajU3F4yaZB3k/d3eqWROGMfUG1rNYABaogO/7Va++MMAifgUu4jT8s7fdr61Z8qwng7CmrOnRHFjCwilNqsDqsBKyN3u9UJk8/iH9KiiRpFbQEGs6/SCrVq11Nk1rhjOTumEyfkC3qeGkJlU48Skh9gtNstHt+K2BngSOLZrOy6E10EEhYDWuN1ikYJKfVIZ8M7O0edWfNgMH1OGF7fD0yYCFcErRfBbLCgCdfOU64WrnvQ+0dfTvKsGqz6rFB5lhnEhwcILhzQ32x1FEhys0c9/Hv8Tn8aHe65F31qevA48sqZEaW7uz0wrkXnIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHiD8hMsd4H/SOCS2+uDAb8MqlHZUDkmHIMRFsR/TzU=;
 b=uFiQwGTuS3gcxjMmsSyLXdHq3BG1ucY/CYTiEv6cw5r7B+THoaMTyoBSnVw4RMQ8xhLJFgC4ORTBSIAOY3dnpBsBDIGFKzZrGgV5qg9v3JcpCIVFQUSAKgV6s9zJYSXkTCjy8z5PF7N438bQAU/t6Jn9tG6p4IbSv9e+HG26bCk=
Received: from BY3PR05MB8531.namprd05.prod.outlook.com (2603:10b6:a03:3ce::6)
 by DM6PR05MB3931.namprd05.prod.outlook.com (2603:10b6:5:81::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.14; Mon, 15 Aug
 2022 16:05:36 +0000
Received: from BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::d813:9300:4877:39d0]) by BY3PR05MB8531.namprd05.prod.outlook.com
 ([fe80::d813:9300:4877:39d0%8]) with mapi id 15.20.5546.015; Mon, 15 Aug 2022
 16:05:36 +0000
To: Alexander Atanasov <alexander.atanasov@virtuozzo.com>
Subject: Re: [PATCH v1 2/2] Drivers: virtio: balloon: Report inflated memory
Thread-Topic: [PATCH v1 2/2] Drivers: virtio: balloon: Report inflated memory
Thread-Index: AQHYq9YDdj/O5CsJlUeEIqWy1OYxe62m18WAgAkcQYCAADYCgA==
Date: Mon, 15 Aug 2022 16:05:36 +0000
Message-ID: <F230BF95-0EA2-4A12-A21A-E967E07589FF@vmware.com>
References: <20220809094933.2203087-1-alexander.atanasov@virtuozzo.com>
 <20220809095358.2203355-1-alexander.atanasov@virtuozzo.com>
 <83B75FC4-595D-496B-91EF-ECCE16D1E2CE@vmware.com>
 <93df4e05-30d7-8176-23a6-948c1bfe4225@virtuozzo.com>
In-Reply-To: <93df4e05-30d7-8176-23a6-948c1bfe4225@virtuozzo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ba0d6b9-62dd-4ff0-b7d7-08da7ed7fd9a
x-ms-traffictypediagnostic: DM6PR05MB3931:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bdUCHej24k+FtnFZ04jYEDJy76m+f/XSjB+uZ+ZeR/1mtUYOeCOGbgypLAJI+hEYvyL08U9/eP8WYk/PnTGbywnZyLgnFC+C4hRUpzG+e7Jz40EdtudxvN+F3Opzee0SYOyq1Y3ptzg+jB9hMkbjJn6Or6f7HrX37rfzyHBXeL83cEkI9vQ1QEmm44i9yHLzYUeffcyhvBX1EWK8Wd2+DfZ9OZ8EMF3IqSHg2y5U9AQj+HjF3BS2FVcl+qvrFcWSZSYv/S9g0ZXwda7StyNSxs34igyzqER2JOkzaTV35OdzhpG1Pfm+tBxMdaU7ErLN4TSzqc80vlKFsItZeOqPh7th6JRPtL3qzyC6Cq0wu/vGwH9lZ0/ueojDs9JZ/9FHHbHpL9+4i4XSBhA2ZCAuSUx0FDYC0QHw49d1t6YI+/84PPPg7kr9zCrajBNodQdZJ0+SpeSdp6T8abkj2ZPg11osrdE0kD61aEQpooNSA9pQ0rjFYiyRtp2WYtSkkqpQz5WNk7/RiGx712h3Tgs4QB0VVXiK2XjU7vCV+tGrBI2iGHRnIYtNxRCalJbjbih59AeflyxCdORJFPk7D2Ch0rp2BO0MO5ud8+JkHF4M41ZH1DWR5B5GHXfaLknO4Z6klegSQO/59mwp08HaiWZpUVGFa60YK/T0/ReycmY/1voe8iG7AiStJg7IdBmGpUK8g/Yb+FoljFRDG9GFl6X8PnsjV1s7Ny6aJGl2i5L1LSdS1sBmt5gW2Ba13aw1yIglAgyTClmsN0wgXWKFiN/SRn7kBM9I/3ElUcMH6ZHNMQh+YC6PEHhmY6PJpx6MdFDMaBNKllYcj31Hc0MnM+u5yQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY3PR05MB8531.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(38100700002)(38070700005)(6512007)(478600001)(53546011)(71200400001)(26005)(6506007)(36756003)(86362001)(107886003)(2616005)(6486002)(41300700001)(186003)(83380400001)(66446008)(4326008)(66946007)(5660300002)(8676002)(66476007)(66556008)(76116006)(64756008)(6916009)(316002)(54906003)(33656002)(122000001)(8936002)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RS8wWmxxdGVBMFFEZHRKbWJ1MEdSWDMvWFVRdzV5T0t4REFNV0xCL29PRGNV?=
 =?utf-8?B?WFBHcER0cUROaFh4M1NQSG5OVHZvTUZvUFVLZUtkZGNXcnpBNkF5R0J2NzFa?=
 =?utf-8?B?N0hwQ3BZK0l6OEFnMUpaMmFlSTVLTWxRU2hKeUQ3dVdpOVhqUmpUUkwrSHFs?=
 =?utf-8?B?aXROL3BZYzQ3dTRHdld0cGs4NzZsdUkrWjZraWtRMlVvc0ZDZk1oUTdKVkhq?=
 =?utf-8?B?ZC9iQzBSalBiVU1vdjFlYnAvUy9mVFNqYmJTNHpzZTVLWExrTFRvNHFWdUs1?=
 =?utf-8?B?NGZkUG5jeWU0TGhQSkp5Y21PaEpMalVrUnlLYjJkS3E1dEZyTjRyMmJBRGFy?=
 =?utf-8?B?bzRaM1ZXZERGZWNTbGtsYlVhSnMrbVJUL1dRSU0vbkVETkNHY0tXclVSbXN1?=
 =?utf-8?B?RXh2bkdTc3lCRDJ6TmpHSDlwaXoxaEVyUzVlQzJDb0hYNTQxZEhNUXZwNnZs?=
 =?utf-8?B?c2RJUkNySmJGWTJ1SU1KOGNZWnpNWXVQeXFjZmkyeFRpeGgyMDhGSy9xdTBy?=
 =?utf-8?B?Y3lvY0NCNXdvZWR1YWFFY1hlY05jZ0dicUtRUTRKb2Z5WWRmNWZTZE93dnhm?=
 =?utf-8?B?QUx3bVRNOVg2U0VwV3dySjAySFpMNUplZG9VTU9Jam9vRjZiNUFCR055Uzhn?=
 =?utf-8?B?Q0MrVlFkbjNWcVVoYlkyOW5mSjVkTldtYjVNYnFQbHJQYVRETVcvcUtGMXBX?=
 =?utf-8?B?RXRYbXEwR0tpUjJSd0lNRDBTZStQT2Iwc2I4SExSc0NUbFlqRUpaNnpKQnkw?=
 =?utf-8?B?MEtyRzBrVVZyWi9nT3owanh1WEtHWVpxdmp0WE9EVE5objVrQm96Y3JwOEVH?=
 =?utf-8?B?Y0w0S283WjJacEpDYjF4RjlGWHhCdElxVStqVGZ4dDUzcXA1N2Qram5KMHJz?=
 =?utf-8?B?aENSZ3YzazNESXRUbllPdEh2QVlQU2lObUp5TUlmRzVIT3dqUmVGS3p2Rkdy?=
 =?utf-8?B?RGR1TzVKUmltb2JHYXNyWm5LbTVON0QrUHVaQTRBOGYxb2hzdUZ5VUlQdWhs?=
 =?utf-8?B?bkQrbTZsZlBDYjFJaDVSQW1GMUZWUjRkbEFRMmlXb0g5T1hETHZKUHVtM3A0?=
 =?utf-8?B?VEdIN0Z3aDVqSXdHMlZtM0RuMnd1VTFycmhsdFEwOExmT2taMHBRNDJ6N2Zy?=
 =?utf-8?B?ZExLUzhmZ1h6Z3BrakdjeXlPZHVmSHlsSk0yTC92azVNZFgxSndTbXhEWDBq?=
 =?utf-8?B?UDlCb3Fsc0N1NmQvaDI2TjZwNzh2ZzBSUDRxSW8xaHlzUzBDSlNabXNDN21E?=
 =?utf-8?B?SC9TK1ROMGxMbzF0UkhJM2dOSGtRazhvRWNoY0xtNjVwbWc0VDlJTE5jeGNH?=
 =?utf-8?B?VTlWV052MXQ4aW9ZK0tGMDdpdmkvNVRZUUZibEcxWFZhbkZGSTZOZzRDUjlk?=
 =?utf-8?B?MDgrM2N6VEsvdDVwL092TCtraW40cVk5ZlZoc21SdGd1L3NUREMyaFhJQjFX?=
 =?utf-8?B?UU9lZm5RTTBETVlXMGxzcTlmdGFsczNzbzdRMW1ncE9LUTFiNlVwbG1VZVBp?=
 =?utf-8?B?QlQyak9Cb29hNjY2emhPTmdkdC9YQjMyZjhjQXVITkpJOWNHc0t0V3h4aXla?=
 =?utf-8?B?ZTFNV1dRTzdRbnhQM254cHRRNllETzVvN2NkVnhTUDh3MjNOMEJaTW1GQmM0?=
 =?utf-8?B?V2pzUHM5RURPR2tKZzdVdklEMFpSUzdJVUFnd290aEJKYWNQRWEwbHNaZXZO?=
 =?utf-8?B?RmEwdVpMLzkvTWpCQVRIUlk3R2FRTEZiK00xTVdSTUlFc2lOUnhoS0F5ZjEx?=
 =?utf-8?B?N1JuZDh0ZTlUM3hiS0hGMEdlRDY1OTlianpNci8xaCttaUFZOUN5OGVsaUE2?=
 =?utf-8?B?VEpOK3hXMWN3YitGTzhPejZIdFNDT0NBZzYwc21VN0JGRCs2aThDekZzUlpx?=
 =?utf-8?B?ODFTMDljV2FFTXJIdmJFS3dOdHUwQThRT1hFL054ZE1mZDRFS2NpSnE4M2tP?=
 =?utf-8?B?alN5WFRjRytXSnBMeVhZem9TczM5RWcyMDZnRE9XQXlvTmZwYjRNRWxnUUFm?=
 =?utf-8?B?V2FWcXZXSSs1dUxLcHFxY2s3WFFNNEwzWklQQThaajlyaHBWL01CYmUzb2Vk?=
 =?utf-8?B?bE53UmRpZGlPK3h0QU04ZFJUdzNwQ1l5K2xVelZYS0dkVnFsbDFGejExTlA2?=
 =?utf-8?Q?Ktyi0Oy+VPy5jZ4MOj6UwFBK4?=
Content-ID: <035D345BD3147149924CA1D87AD579B7@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR05MB8531.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba0d6b9-62dd-4ff0-b7d7-08da7ed7fd9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 16:05:36.3565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4w06tDA54AHSL8efwS5qw3FATbq/7Am1DyA8vPK5V1+RjcIUUrc6KsdciRhaS1Iwyoqtlx54q1hmagyAXVFLyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR05MB3931
Cc: Wei Liu <wei.liu@kernel.org>, Pv-drivers <Pv-drivers@vmware.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 "kernel@openvz.org" <kernel@openvz.org>
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
From: Nadav Amit via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Nadav Amit <namit@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gQXVnIDE1LCAyMDIyLCBhdCA1OjUyIEFNLCBBbGV4YW5kZXIgQXRhbmFzb3YgPGFsZXhhbmRl
ci5hdGFuYXNvdkB2aXJ0dW96em8uY29tPiB3cm90ZToNCg0KPiDimqAgRXh0ZXJuYWwgRW1haWwN
Cj4gDQo+IEhpLA0KPiANCj4gT24gOS4wOC4yMiAyMDo0NCwgTmFkYXYgQW1pdCB3cm90ZToNCj4+
IE9uIEF1ZyA5LCAyMDIyLCBhdCAyOjUzIEFNLCBBbGV4YW5kZXIgQXRhbmFzb3YgPGFsZXhhbmRl
ci5hdGFuYXNvdkB2aXJ0dW96em8uY29tPiB3cm90ZToNCj4+IA0KPj4+IFVwZGF0ZSB0aGUgdmFs
dWUgaW4gcGFnZV9hbGxvYyBvbiBiYWxsb29uIGZpbGwvbGVhay4NCj4+IA0KPj4gU29tZSBnZW5l
cmFsIGNvbW1lbnRzIGlmIHRoaXMgcGF0Y2ggZ29lcyBmb3J3YXJkLg0KPj4gDQo+PiBQbGVhc2Ug
Y2MgcHYtZHJpdmVyc0B2bXdhcmUuY29tIGluIHRoZSBmdXR1cmUuDQo+IA0KPiBPay4NCj4gDQo+
Pj4gQ2M6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPg0KPj4+IENjOiBXZWkg
TGl1IDx3ZWkubGl1QGtlcm5lbC5vcmc+DQo+Pj4gQ2M6IE5hZGF2IEFtaXQgPG5hbWl0QHZtd2Fy
ZS5jb20+DQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEF0YW5hc292IDxhbGV4
YW5kZXIuYXRhbmFzb3ZAdmlydHVvenpvLmNvbT4NCj4+PiAtLS0NCj4+PiBkcml2ZXJzL3ZpcnRp
by92aXJ0aW9fYmFsbG9vbi5jIHwgMTMgKysrKysrKysrKysrKw0KPj4+IDEgZmlsZSBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspDQo+Pj4gDQo+Pj4gRmlydHMgdXNlciwgb3RoZXIgYmFsbG9vbnMg
aSB3aWxsIGRvIGlmIGl0IGlzIGFjY2VwdGVkIHRvIGF2b2lkIHRvbyBtdWNoIGVtYWlscy4NCj4+
PiANCj4+PiANCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24u
YyBiL2RyaXZlcnMvdmlydGlvL3ZpcnRpb19iYWxsb29uLmMNCj4+PiBpbmRleCBiOTczN2RhNmM0
ZGQuLmUyNjkzZmZiZDQ4YiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL3ZpcnRpby92aXJ0aW9f
YmFsbG9vbi5jDQo+Pj4gKysrIGIvZHJpdmVycy92aXJ0aW8vdmlydGlvX2JhbGxvb24uYw0KPj4+
IEBAIC0yMDgsNiArMjA4LDE2IEBAIHN0YXRpYyB2b2lkIHNldF9wYWdlX3BmbnMoc3RydWN0IHZp
cnRpb19iYWxsb29uICp2YiwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBhZ2VfdG9fYmFsbG9vbl9wZm4ocGFnZSkgKyBpKTsNCj4+PiB9DQo+Pj4gDQo+Pj4gK3N0
YXRpYyB2b2lkIHVwZGF0ZV9tZW1pbmZvKHN0cnVjdCB2aXJ0aW9fYmFsbG9vbiAqdmIpDQo+PiAN
Cj4+IFB1dHRpbmcgYXNpZGUgdGhlIGxlc3MtdGhhbi1vcHRpbWFsIGZ1bmN0aW9uIG5hbWUsIEkg
d291bGQgbGlrZSB0byBhc2sgdGhhdA0KPiANCj4gUmlnaHQsIGkgd2lsbCB0aGluayBvZiBhIGJl
dHRlciBvbmUuDQo+IA0KPj4gYW55IG5ldyBnZW5lcmljIGJhbGxvb24gbG9naWMgd291bGQgZ28g
aW50byBiYWxsb29uX2NvbXBhY3Rpb24uW2hjXSBhcyBtdWNoDQo+IA0KPiBJZiBpdCBpcyBnb2lu
ZyB0byBiZSBhIHBsYWNlIGZvciBnZW5lcmljIGxvZ2ljIG1heSBiZSBpdCBzaG91bGQgYmUNCj4g
cmVuYW1lZCB0byBiYWxsb29uX2NvbW1vbi5bY2hdID8NCj4gDQo+PiBhcyBwb3NzaWJsZS4gSSBt
YWRlIHRoZSBlZmZvcnQgdG8gcmV1c2UgdGhpcyBpbmZyYXN0cnVjdHVyZSAod2hpY2ggaXMgbm93
DQo+PiB1c2VkIGJ5IGJvdGggVk13YXJlIGFuZCB2aXJ0aW8pLCBhbmQgd291bGQgcHJlZmVyIHRv
IHNoYXJlIGFzIG11Y2ggY29kZSBhcw0KPj4gcG9zc2libGUuDQo+PiANCj4+IEZvciBpbnN0YW5j
ZSwgSSB3b3VsZCBhcHByZWNpYXRlIGlmIHRoZSB1cGRhdGUgdXBvbiBpbmZsYXRlIHdvdWxkIGdv
IGludG8NCj4+IGJhbGxvb25fcGFnZV9saXN0X2VucXVldWUoKSBhbmQgYmFsbG9vbl9wYWdlX2Vu
cXVldWUoKS4gVk13YXJlJ3MgMk1CIHBhZ2VzDQo+PiBsb2dpYyBpcyBub3Qgc2hhcmVkLCBzbyBp
dCB3b3VsZCByZXF1aXJlIGEgY2hhbmdlIHRoYXQgaXMgc3BlY2lmaWMgZm9yDQo+PiBWTXdhcmUg
Y29kZS4NCj4gDQo+IEkgbG9va2VkIGF0IHRoZSBjb2RlIGFuZCBpIGRvIG5vdCBzZWUgaG93IGkg
Y2FuIHJldXNlIGl0IHNpbmNlDQo+IEJBTExPT05fQ09NUEFDVElPTiBjYW4gYmUgZGlzYWJsZWQg
YW5kIGFzIHlvdSBzYXkgZXZlbiBmb3IgVk1XYXJlIGl0DQo+IHdvdWxkIHJlcXVpcmUgdXBkYXRl
cyBvbiBvdGhlciBwbGFjZXMuIExvb2tzIGxpa2UgaWYgaSBkbyBzbyBpIHdvdWxkDQo+IGhhdmUg
dG8gaGFuZGxlIHVwZGF0ZSBmcm9tIGVhY2ggZHJpdmVyIGZvciBib3RoIGNhc2VzLiBJIHRoaW5r
IGl0IGlzDQo+IGJldHRlciB0byBjbGVhcmx5IG1hcmsgdGhlIHNwb3RzIHdoZW4gZHJpdmVycyBk
byB0aGVpciBpbnRlcm5hbA0KPiByZWNhbGN1bGF0aW9ucyBhbmQgcmVwb3J0IHRvIHRoZSBjb3Jl
LiBJIHNlZSBvbmx5IFZNV2FyZSBpcyB1c2luZw0KPiBiYWxsb29uX3BhZ2VfbGlzdF9lbnF1ZXVl
ICwgdmlydGlvIGJhbGxvb24gaXMgdXNpbmcgb25seSBtaWdyYXRpb24gYW5kDQo+IGkgZG9uJ3Qg
c2VlIGhvdyB0byBob29rIGl0IHRoZXJlIC0gaSBoYXZlbid0IGNoZWNrZWQgdGhlIHJlc3Qgb2Yg
dGhlDQo+IGJhbGxvb25zIGJ1dCBpIGd1ZXNzIGl0IHdvdWxkIGJlIHNpbWlsaWFyIC4gSSBhZ3Jl
ZSBpdCBpcyBhIGdvb2QgdG8gaGF2ZQ0KPiBhIGNvbW1vbiBwbGFjZSBmb3Igc3VjaCBsb2dpYyBi
dXQgaXQgbWlnaHQgYmUgYmV0dGVyIG9mIGZvciBhIHNlcGFyYXRlDQo+IHdvcmsgaW4gdGhlIGZ1
dHVyZS4NCg0KRmluZS4gSSB3b3VsZCBsaXZlIHdpdGggd2hhdGV2ZXIgeW91IGRvIGFuZCBpZiBu
ZWVkZWQgY2hhbmdlIGl0IGxhdGVyLg0KDQpUaGFua3MgZm9yIGNvbnNpZGVyaW5nLg0KDQpSZWdh
cmRzLA0KTmFkYXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4
LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
