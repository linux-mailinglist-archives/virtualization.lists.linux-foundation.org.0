Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BD07A0083
	for <lists.virtualization@lfdr.de>; Thu, 14 Sep 2023 11:40:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 246E241F57;
	Thu, 14 Sep 2023 09:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 246E241F57
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GEnmxWVE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VfeSDWVr_lYW; Thu, 14 Sep 2023 09:40:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 22256404EE;
	Thu, 14 Sep 2023 09:40:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22256404EE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5483CC008C;
	Thu, 14 Sep 2023 09:40:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51575C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Sep 2023 09:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A69782068
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Sep 2023 09:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A69782068
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=GEnmxWVE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ek8goXieGn2p
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Sep 2023 09:40:15 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::623])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98BA982060
 for <virtualization@lists.linux-foundation.org>;
 Thu, 14 Sep 2023 09:40:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98BA982060
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vh0dyL1D7x25v41TohxZm8xTXHXS3OmHxCbAveHLprDJd9R39AonqTEuS620GVnA7zK/jp54KvWugVnDjdsGwJYeDifrz0CwgFg5bB6ZaGr3rZavlH5wIQXJbHZow5d+cJzQnhggN2l3hbFe/n3B1PEmFTf57wLgQcyiZHN1DbDUqqTOLd8YvohS0EwuOBi4Q2rOmDGaezxRmPk8gCY5tmc0aysYcTwNpi65MqNk03XP2P7Yi4pRSTRjUMU1P2aB7KqmszlecbpiyTkdABcFSVOt3Iuttw+XKLgpw+/vStj0F2uMFtmxwA33PyaJpSnWghxT1+lyvD9LEbf0LOPNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3r+XeANABLrVQw0bS2HwcqkQZ2if+HhqWDpoWtwngGc=;
 b=T9Y2+trS1Dw+fdvYFme2Hf9QFO52XzbdCh3ZiamFnU7LKzu4NqHVt9koibhZOa+t/7Vw6sjut6xaTQlH+U7Hjbw/0CZqcv+D3TSJRQiUf3tFzUKWHrok0zbdqjsXAPTInxS4jzQxiDkcUiOg0zjXproChWEH9DyyY2ADpv9Q4XgRixQvne2tk/Rf8ABS7D9zV5HwvvifYWM2z22qaL0iBP8kAPfN2EH7bnnWFKvU/Dwht8nFf4F313rHCBYIWONZxQRC3KGTXvuq9EEJZNtmFLdv98m499uxVkFwiLFTECcP0R640co+5Fp2sSMvGRc4ptgMfilYVjjZB3qZ4CyERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3r+XeANABLrVQw0bS2HwcqkQZ2if+HhqWDpoWtwngGc=;
 b=GEnmxWVEx/lsgeB9b2D0Ae+sInu2k+i9TquWqUR6Frv3/ZMzNPDOJnyw5ioynmtqaEl6zgOHYgDKWrribmUHWMbWLSGJxVxznaSXGLBYHQChXfhcvHDGZksOf8upCZ+Tz0z0Xi2QT+BMYkrVwVB1WLF172rgHAqxrq3iSkzvH+Fw1fEl4iPNIcqFKjG9b1bYqkrjJoOCm4Z1MZyrt0kfczDVIKpIXS1QWcn7TlQYFPqgJ9Pg5XvkhhIq36YKIIG3wBr1jQ6ycyYvC9IIPwyZej8K+r2LYo3e7Aa26BxCWHfmtzusm2Rollypp64Y+JPS78XAAjkHzYeQ4LmS2SDH+A==
Received: from DM6PR12MB5565.namprd12.prod.outlook.com (2603:10b6:5:1b6::13)
 by PH7PR12MB7307.namprd12.prod.outlook.com (2603:10b6:510:20b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Thu, 14 Sep
 2023 09:40:12 +0000
Received: from DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667]) by DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667%4]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 09:40:11 +0000
To: "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com"
 <jasowang@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v2] vdpa/mlx5: Fix firmware error on creation of 1k VQs
Thread-Topic: [PATCH v2] vdpa/mlx5: Fix firmware error on creation of 1k VQs
Thread-Index: AQHZ3CPsR3FTa/LHFUavTUzAL4GbfrAaJqGA
Date: Thu, 14 Sep 2023 09:40:11 +0000
Message-ID: <ad0bceb21332a8ccd764c5efc94fbcb3059ef360.camel@nvidia.com>
References: <20230831155702.1080754-1-dtatulea@nvidia.com>
In-Reply-To: <20230831155702.1080754-1-dtatulea@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5565:EE_|PH7PR12MB7307:EE_
x-ms-office365-filtering-correlation-id: 6c99bddd-b26b-43bb-9399-08dbb5069756
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KA8js4kBQuR/hTA3cfhsYc1BOdjoNjCS9YbUESZprnMIU6edaafIq7QiSfP4eL9mXe2HXN6zsubFgx8rg7+/bJUYKp111Mhg9vFa3Dzdr7xImGi5kpI8ki1Hc4KeFkKLx8EKHVyKeDmsirLRnQFfOeEPqB5i2GpBao4pyn0f6/e5GDYOHizPlufkeW/NcpfaGGu35HgA5S6PqDsbq2/cwz3CoTK1QFfoCO3zagRFwukikTxBrNJc4rWsYw8Xktm0O2Nc2tcyCCrIrU8XIHMD46OO8svGh5Q9+EXCKC0Atwvz/IfJPS+6OwUIjT3fuhsweCakj7BQ4J91Xwe2oAQwNSHj2yyHOT1cLl/EXJxrQ8oy6LoEsH+eY+GnA6rETxeVskXepR5ZiSLTj0co+TZRzbWtFmYFk1AQdZgPzjaOm5IphJC1Ae4+EDuufyPZKdUunjbsR5Ljj2NUNSn2rHCSP4ESoBxPUrXsLDnFuPwMKnHbjJ2kPxYidGkd6ate/qXWJblHLB0C5/Q5ULReitAW23eZr/CCeu9zHa1Vyhh8CPlEKv3NcznyR7gzsNDqA2RlLhdy7WO7pstR+gCH7C3DOD0dvUbeR6uN4TyDE5mmR2HogtbZY4JhpitAxUHOzEDL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(136003)(396003)(376002)(186009)(451199024)(1800799009)(36756003)(38100700002)(38070700005)(86362001)(478600001)(5660300002)(6486002)(6506007)(76116006)(91956017)(110136005)(54906003)(64756008)(66446008)(66556008)(66476007)(66946007)(316002)(6512007)(41300700001)(8936002)(2616005)(4326008)(8676002)(71200400001)(2906002)(122000001)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDFBYzdOSEVMc0Z4dGQrbzNVQ0NRWVRtSWREZDZqTGFuOGJLMjNlWks5cmx2?=
 =?utf-8?B?Um4yS0xTOFZBdyttQmVwN0dGUHBLMU9XZG5uL3lRQ0JmNXY4a3g3REkxSDk2?=
 =?utf-8?B?ZzZ5VGhDU01ibEJ2dXAvTW5wUGE1NS9CczRDS3VRWUNSaVZRRVhlSEFSM1pu?=
 =?utf-8?B?d2ZXWFV2N2J3bnQ3dDBhVDcvTGlBT1cvOU9uV2x2enE0ZUp6bnpHTVVMTTVS?=
 =?utf-8?B?ak9aN2lHMEgwdnEyVndBYmQ0d2VaanlISCtadDRON0szT0FGdUQwbVlBaHNN?=
 =?utf-8?B?a0ZhTFdEamU4M3NNNEpCSW12V1hKTUw5cVhNV3VLZURYTUNxS0tlS0ZXOHhX?=
 =?utf-8?B?cjdTd0I1Q3MwNUJONXlSejB3Ym9XcndXRDBQekFLZE1UOU9USXpHZWVLZ05V?=
 =?utf-8?B?ZHJ3SmVScWx4WTd3ZHZCSEtHQk05ZzhqVGJ5RUFXaHRGM3JSU2tLdEtrTTFB?=
 =?utf-8?B?cExsOXR6K1dSaTBMbVF4a3VJemtBbmdWVkhPYmxiR1pMVk9namM0aDg1NVc4?=
 =?utf-8?B?eGFTbDk1VkJTT1U2R0NyYzd6RVdnck9CcU5PQWJRNFN5NkxyeFpBQmkvUmZ1?=
 =?utf-8?B?UHIvVXZUYVRXUVZYSG5hWnhwZFExT21WV3NqQmFXSUM4Znl4R3JXTmp1dThX?=
 =?utf-8?B?R2hJZUx2aHI5L2w1QXpXTkt6Q2dPOTB1Z3lBcXgwWnFWL0FvZzE4YzhtVnJE?=
 =?utf-8?B?clN2Rjc5MnlNajZSaDBzU1gxbmpadE1Ucnl6WTJaUWFoaGRiSzRGaWh5c2dl?=
 =?utf-8?B?d3NhN1pEckRJU3N0Nmd1S0JIZkxlY2haRjR6N0QvaGg5TzBZSzRmNG9BZDVO?=
 =?utf-8?B?MXExT3pIVDNxci81VjNhcDVvMkF5VGdtZmtIa256OG9icCs0emNnaVZEL08v?=
 =?utf-8?B?U05vL2RKYTRhUExCak5xczk4bThzK3dCdnBGeks4ZUVZcGpSWVFXRlRUbkhK?=
 =?utf-8?B?c1NjVzVnSW9sVzdVRmordW81TkxmZTlHbkpWcU4wWFdmTFJNbzJYTGNNbFNv?=
 =?utf-8?B?cUJjd0F6eGlkUFVWaG5nVmx6UHdRN1IwUFlPWjkySmk5dzdOaWJ0TkdEVENk?=
 =?utf-8?B?b2JDZ1JnbUNFNTF1cXFxTnNGa2tPYmNZYmFjQXZPSU1BTmJ4eXdWajR4RW1p?=
 =?utf-8?B?M0lMYjFpTGRRTWM5UVBhb2w3ZlpEcjJiVFhWRmg3a2dIdkZtb2RIZnFNU0pV?=
 =?utf-8?B?a3dTVUF2RUkyaTdhQ002eG04QWxIb0dDVEt5NytrSEw3WHFoZTZKMmMvRS9G?=
 =?utf-8?B?TEx6SHhKbFVtZ0hVbW5QSnQyenQzNXRUVW9vNllLbUlBYmRnN2xLYVJzTmFG?=
 =?utf-8?B?eDU1ZnU3YVEyUVNidWN5ZUN2MzRXelhGOVFxTDNGK1NVQnhxVHNRMnovcll6?=
 =?utf-8?B?QTJFcER2TWNQdG9CUHo3VHJDb0RhZnk3WDRUTnd4RnV5QjcrZWhqRXNIR0dO?=
 =?utf-8?B?bnZ2NXZLS0k5K25ra3lXdlNvK25kM3NxVkxtUGVNUVBRMGw1OXM2UCtobDRX?=
 =?utf-8?B?aXlGNXlOMlhNRmZ0VktCemVPTFgxcVlRaG5Da290TnRMUUJPbUQzTi8xRTF5?=
 =?utf-8?B?V3FFdy9ydlhJY1pUVXFPQ0F1NnVLdmJCM1NpZWtNTDN4WFJiRTRUeFNVUm1s?=
 =?utf-8?B?Vnl4YmVENlJZcXBSc1g3aStuREhLcEJaMTcrenpSYjcyaHZHbUxETzlLU1d3?=
 =?utf-8?B?QjROYXBpa0JPNFdlNTRWQVZRczNvRWd0Y3RCVlN5WXJNRllmUmJ0dFF6aVFy?=
 =?utf-8?B?VUpyVXZhcWpPM09pMFo0dFVzZDBXSURYT0Y0aXhQdHI1Y1dKL1BWSkdscUNm?=
 =?utf-8?B?ckJnQkFyVlR6TGFEUjJDeTJkUTBiKyt4ZVhmS1ZNMi9hQkxVelBBbHVqTmF2?=
 =?utf-8?B?WVFkK25JU0Z1eUhzNWt5ampEODhTVmxwdDNDelRqMHczK2pxZ2ZWWWVaNmYx?=
 =?utf-8?B?bFA4OFB2dXlZNkRoSHBEZldlbVN0cHNlOE5SNnNscEVOckhOYlBtb05ZQnBT?=
 =?utf-8?B?eVZKTjgrTzRxQlBLaHZyQkxXRFlSY3JWT2VONUJ1SmlPek45N280K0xxbUN5?=
 =?utf-8?B?RWFlYTY5Uld0UE83blBGRzNBM1FvRnpXTTRGV08yNThiaUJkQ0F0N1RQT0NX?=
 =?utf-8?B?Q28xNENhWVRsSnhQTktjaGF4T3F2cVY4emZyVENHWmNhVXE5Vzg4MmsxUVVJ?=
 =?utf-8?B?VThnaE54UFlyQ2h2cnBoSE50em9VM0IvQmNReDY3NnNURGFMMGZvSWRNbHgw?=
 =?utf-8?B?akMwK2VFdHRmSWttb3pZVVl0bjRRPT0=?=
Content-ID: <628B32CBF3BC4C4A94D1AAFBBD7C0835@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c99bddd-b26b-43bb-9399-08dbb5069756
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 09:40:11.6292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vu0od1MQjiJ0s9t2HlzmfkoXenh2x85VqIVTlO3ft+jFNS/EgBPs0G7qWYC15oZ067NQwMnEfafQX5D+BN5uSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7307
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
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

T24gVGh1LCAyMDIzLTA4LTMxIGF0IDE4OjUwICswMzAwLCBEcmFnb3MgVGF0dWxlYSB3cm90ZToK
PiBBIGZpcm13YXJlIGVycm9yIGlzIHRyaWdnZXJlZCB3aGVuIGNvbmZpZ3VyaW5nIGEgOWsgTVRV
IG9uIHRoZSBQRiBhZnRlcgo+IHN3aXRjaGluZyB0byBzd2l0Y2hkZXYgbW9kZSBhbmQgdGhlbiB1
c2luZyBhIHZkcGEgZGV2aWNlIHdpdGggbGFyZ2VyCj4gKDFrKSByaW5nczoKPiBtbHg1X2NtZF9v
dXRfZXJyOiBDUkVBVEVfR0VORVJBTF9PQkpFQ1QoMHhhMDApIG9wX21vZCgweGQpIGZhaWxlZCwg
c3RhdHVzIGJhZAo+IHJlc291cmNlKDB4NSksIHN5bmRyb21lICgweGY2ZGI5MCksIGVycigtMjIp
Cj4gCj4gVGhpcyBpcyBkdWUgdG8gdGhlIGZhY3QgdGhhdCB0aGUgaHcgVlEgc2l6ZSBwYXJhbWV0
ZXJzIGFyZSBjb21wdXRlZAo+IGJhc2VkIG9uIHRoZSB1bWVtXzEvMi8zX2J1ZmZlcl9wYXJhbV9h
L2IgY2FwYWJpbGl0aWVzIGFuZCBhbGwKPiBkZXZpY2UgY2FwYWJpbGl0aWVzIGFyZSByZWFkIG9u
bHkgd2hlbiB0aGUgZHJpdmVyIGlzIG1vdmVkIHRvIHN3aXRjaGRldiBtb2RlLgo+IAo+IFRoZSBw
cm9ibGVtYXRpYyBjb25maWd1cmF0aW9uIGZsb3cgbG9va3MgbGlrZSB0aGlzOgo+IDEpIENyZWF0
ZSBWRgo+IDIpIFVuYmluZCBWRgo+IDMpIFN3aXRjaCBQRiB0byBzd2l0Y2hkZXYgbW9kZS4KPiA0
KSBCaW5kIFZGCj4gNSkgU2V0IFBGIE1UVSB0byA5awo+IDYpIGNyZWF0ZSB2RFBBIGRldmljZQo+
IDcpIFN0YXJ0IFZNIHdpdGggdkRQQSBkZXZpY2UgYW5kIDFLIHF1ZXVlIHNpemUKPiAKPiBOb3Rl
IHRoYXQgc2V0dGluZyB0aGUgTVRVIGJlZm9yZSBzdGVwIDMpIGRvZXNuJ3QgdHJpZ2dlciB0aGlz
IGlzc3VlLgo+IAo+IFRoaXMgcGF0Y2ggcmVhZHMgdGhlIGZvcmVtZW50aW9uZWQgdW1lbSBwYXJh
bWV0ZXJzIGF0IHRoZSBsYXRlc3QgcG9pbnQKPiBwb3NzaWJsZSBiZWZvcmUgdGhlIFZRcyBvZiB0
aGUgZGV2aWNlIGFyZSBjcmVhdGVkLgo+IAo+IHYyOgo+IC0gQWxsb2NhdGUgb3V0cHV0IHdpdGgg
a21hbGxvYyB0byByZWR1Y2Ugc3RhY2sgZnJhbWUgc2l6ZS4KPiAtIFJlbW92ZWQgc3RhYmxlIGZy
b20gY2MuCj4gCkdlbnRsZSBwaW5nLiBBbnkgdGhvdWdodHMgb24gdGhpcyBmaXg/CgpUaGFua3Ms
CkRyYWdvcwo+IEZpeGVzOiAxYTg2YjM3N2FhMjEgKCJ2ZHBhL21seDU6IEFkZCBWRFBBIGRyaXZl
ciBmb3Igc3VwcG9ydGVkIG1seDUgZGV2aWNlcyIpCj4gU2lnbmVkLW9mZi1ieTogRHJhZ29zIFRh
dHVsZWEgPGR0YXR1bGVhQG52aWRpYS5jb20+Cj4gCj4gLS0tCj4gwqBkcml2ZXJzL3ZkcGEvbWx4
NS9uZXQvbWx4NV92bmV0LmMgfCA2MyArKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4g
wqBkcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmggfMKgIDkgKysrKysKPiDCoDIgZmls
ZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5jCj4gYi9kcml2ZXJzL3ZkcGEv
bWx4NS9uZXQvbWx4NV92bmV0LmMKPiBpbmRleCA0MGEwM2IwOGQ3Y2YuLmVmNTkwN2IxZDUxMyAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMKPiArKysgYi9k
cml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMKPiBAQCAtNjI1LDMwICs2MjUsNzAgQEAg
c3RhdGljIHZvaWQgY3FfZGVzdHJveShzdHJ1Y3QgbWx4NV92ZHBhX25ldCAqbmRldiwgdTE2Cj4g
aWR4KQo+IMKgwqDCoMKgwqDCoMKgwqBtbHg1X2RiX2ZyZWUobmRldi0+bXZkZXYubWRldiwgJnZj
cS0+ZGIpOwo+IMKgfQo+IMKgCj4gK3N0YXRpYyBpbnQgcmVhZF91bWVtX3BhcmFtcyhzdHJ1Y3Qg
bWx4NV92ZHBhX25ldCAqbmRldikKPiArewo+ICvCoMKgwqDCoMKgwqDCoHUzMiBpbltNTFg1X1NU
X1NaX0RXKHF1ZXJ5X2hjYV9jYXBfaW4pXSA9IHt9Owo+ICvCoMKgwqDCoMKgwqDCoHUxNiBvcG1v
ZCA9IChNTFg1X0NBUF9WRFBBX0VNVUxBVElPTiA8PCAxKSB8IChIQ0FfQ0FQX09QTU9EX0dFVF9D
VVIgJgo+IDB4MDEpOwo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBtbHg1X2NvcmVfZGV2ICptZGV2
ID0gbmRldi0+bXZkZXYubWRldjsKPiArwqDCoMKgwqDCoMKgwqBpbnQgb3V0X3NpemU7Cj4gK8Kg
wqDCoMKgwqDCoMKgdm9pZCAqY2FwczsKPiArwqDCoMKgwqDCoMKgwqB2b2lkICpvdXQ7Cj4gK8Kg
wqDCoMKgwqDCoMKgaW50IGVycjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgb3V0X3NpemUgPSBNTFg1
X1NUX1NaX0JZVEVTKHF1ZXJ5X2hjYV9jYXBfb3V0KTsKPiArwqDCoMKgwqDCoMKgwqBvdXQgPSBr
emFsbG9jKG91dF9zaXplLCBHRlBfS0VSTkVMKTsKPiArwqDCoMKgwqDCoMKgwqBpZiAoIW91dCkK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICvC
oMKgwqDCoMKgwqDCoE1MWDVfU0VUKHF1ZXJ5X2hjYV9jYXBfaW4sIGluLCBvcGNvZGUsIE1MWDVf
Q01EX09QX1FVRVJZX0hDQV9DQVApOwo+ICvCoMKgwqDCoMKgwqDCoE1MWDVfU0VUKHF1ZXJ5X2hj
YV9jYXBfaW4sIGluLCBvcF9tb2QsIG9wbW9kKTsKPiArwqDCoMKgwqDCoMKgwqBlcnIgPSBtbHg1
X2NtZF9leGVjX2lub3V0KG1kZXYsIHF1ZXJ5X2hjYV9jYXAsIGluLCBvdXQpOwo+ICvCoMKgwqDC
oMKgwqDCoGlmIChlcnIpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbWx4NV92
ZHBhX3dhcm4oJm5kZXYtPm12ZGV2LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIkZhaWxlZCByZWFkaW5nIHZkcGEgdW1lbSBjYXBhYmlsaXRpZXMgd2l0
aCBlcnIgJWRcbiIsCj4gZXJyKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290
byBvdXQ7Cj4gK8KgwqDCoMKgwqDCoMKgfQo+ICsKPiArwqDCoMKgwqDCoMKgwqBjYXBzID3CoCBN
TFg1X0FERFJfT0YocXVlcnlfaGNhX2NhcF9vdXQsIG91dCwgY2FwYWJpbGl0eSk7Cj4gKwo+ICvC
oMKgwqDCoMKgwqDCoG5kZXYtPnVtZW1fMV9idWZmZXJfcGFyYW1fYSA9IE1MWDVfR0VUKHZpcnRp
b19lbXVsYXRpb25fY2FwLCBjYXBzLAo+IHVtZW1fMV9idWZmZXJfcGFyYW1fYSk7Cj4gK8KgwqDC
oMKgwqDCoMKgbmRldi0+dW1lbV8xX2J1ZmZlcl9wYXJhbV9iID0gTUxYNV9HRVQodmlydGlvX2Vt
dWxhdGlvbl9jYXAsIGNhcHMsCj4gdW1lbV8xX2J1ZmZlcl9wYXJhbV9iKTsKPiArCj4gK8KgwqDC
oMKgwqDCoMKgbmRldi0+dW1lbV8yX2J1ZmZlcl9wYXJhbV9hID0gTUxYNV9HRVQodmlydGlvX2Vt
dWxhdGlvbl9jYXAsIGNhcHMsCj4gdW1lbV8yX2J1ZmZlcl9wYXJhbV9hKTsKPiArwqDCoMKgwqDC
oMKgwqBuZGV2LT51bWVtXzJfYnVmZmVyX3BhcmFtX2IgPSBNTFg1X0dFVCh2aXJ0aW9fZW11bGF0
aW9uX2NhcCwgY2FwcywKPiB1bWVtXzJfYnVmZmVyX3BhcmFtX2IpOwo+ICsKPiArwqDCoMKgwqDC
oMKgwqBuZGV2LT51bWVtXzNfYnVmZmVyX3BhcmFtX2EgPSBNTFg1X0dFVCh2aXJ0aW9fZW11bGF0
aW9uX2NhcCwgY2FwcywKPiB1bWVtXzNfYnVmZmVyX3BhcmFtX2EpOwo+ICvCoMKgwqDCoMKgwqDC
oG5kZXYtPnVtZW1fM19idWZmZXJfcGFyYW1fYiA9IE1MWDVfR0VUKHZpcnRpb19lbXVsYXRpb25f
Y2FwLCBjYXBzLAo+IHVtZW1fM19idWZmZXJfcGFyYW1fYik7Cj4gKwo+ICtvdXQ6Cj4gK8KgwqDC
oMKgwqDCoMKga2ZyZWUob3V0KTsKPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiArfQo+ICsK
PiDCoHN0YXRpYyB2b2lkIHNldF91bWVtX3NpemUoc3RydWN0IG1seDVfdmRwYV9uZXQgKm5kZXYs
IHN0cnVjdAo+IG1seDVfdmRwYV92aXJ0cXVldWUgKm12cSwgaW50IG51bSwKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbWx4NV92ZHBh
X3VtZW0gKip1bWVtcCkKPiDCoHsKPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbWx4NV9jb3JlX2Rl
diAqbWRldiA9IG5kZXYtPm12ZGV2Lm1kZXY7Cj4gLcKgwqDCoMKgwqDCoMKgaW50IHBfYTsKPiAt
wqDCoMKgwqDCoMKgwqBpbnQgcF9iOwo+ICvCoMKgwqDCoMKgwqDCoHUzMiBwX2E7Cj4gK8KgwqDC
oMKgwqDCoMKgdTMyIHBfYjsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBzd2l0Y2ggKG51bSkgewo+
IMKgwqDCoMKgwqDCoMKgwqBjYXNlIDE6Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHBfYSA9IE1MWDVfQ0FQX0RFVl9WRFBBX0VNVUxBVElPTihtZGV2LAo+IHVtZW1fMV9idWZmZXJf
cGFyYW1fYSk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBfYiA9IE1MWDVfQ0FQ
X0RFVl9WRFBBX0VNVUxBVElPTihtZGV2LAo+IHVtZW1fMV9idWZmZXJfcGFyYW1fYik7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBfYSA9IG5kZXYtPnVtZW1fMV9idWZmZXJfcGFy
YW1fYTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcF9iID0gbmRldi0+dW1lbV8x
X2J1ZmZlcl9wYXJhbV9iOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKnVtZW1w
ID0gJm12cS0+dW1lbTE7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsK
PiDCoMKgwqDCoMKgwqDCoMKgY2FzZSAyOgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBwX2EgPSBNTFg1X0NBUF9ERVZfVkRQQV9FTVVMQVRJT04obWRldiwKPiB1bWVtXzJfYnVmZmVy
X3BhcmFtX2EpOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwX2IgPSBNTFg1X0NB
UF9ERVZfVkRQQV9FTVVMQVRJT04obWRldiwKPiB1bWVtXzJfYnVmZmVyX3BhcmFtX2IpOwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwX2EgPSBuZGV2LT51bWVtXzJfYnVmZmVyX3Bh
cmFtX2E7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBfYiA9IG5kZXYtPnVtZW1f
Ml9idWZmZXJfcGFyYW1fYjsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCp1bWVt
cCA9ICZtdnEtPnVtZW0yOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7
Cj4gwqDCoMKgwqDCoMKgwqDCoGNhc2UgMzoKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcF9hID0gTUxYNV9DQVBfREVWX1ZEUEFfRU1VTEFUSU9OKG1kZXYsCj4gdW1lbV8zX2J1ZmZl
cl9wYXJhbV9hKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcF9iID0gTUxYNV9D
QVBfREVWX1ZEUEFfRU1VTEFUSU9OKG1kZXYsCj4gdW1lbV8zX2J1ZmZlcl9wYXJhbV9iKTsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcF9hID0gbmRldi0+dW1lbV8zX2J1ZmZlcl9w
YXJhbV9hOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwX2IgPSBuZGV2LT51bWVt
XzNfYnVmZmVyX3BhcmFtX2I7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAqdW1l
bXAgPSAmbXZxLT51bWVtMzsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFr
Owo+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqAoKnVtZW1wKS0+c2l6
ZSA9IHBfYSAqIG12cS0+bnVtX2VudCArIHBfYjsKPiDCoH0KPiDCoAo+IEBAIC0yNjc5LDYgKzI3
MTksMTEgQEAgc3RhdGljIGludCBzZXR1cF9kcml2ZXIoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12
ZGV2KQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBvdXQ7Cj4gwqDCoMKg
wqDCoMKgwqDCoH0KPiDCoMKgwqDCoMKgwqDCoMKgbWx4NV92ZHBhX2FkZF9kZWJ1Z2ZzKG5kZXYp
Owo+ICsKPiArwqDCoMKgwqDCoMKgwqBlcnIgPSByZWFkX3VtZW1fcGFyYW1zKG5kZXYpOwo+ICvC
oMKgwqDCoMKgwqDCoGlmIChlcnIpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdv
dG8gZXJyX3NldHVwOwo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgZXJyID0gc2V0dXBfdmlydHF1ZXVl
cyhtdmRldik7Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChlcnIpIHsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoG1seDVfdmRwYV93YXJuKG12ZGV2LCAic2V0dXBfdmlydHF1ZXVlc1xu
Iik7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQuaAo+IGIv
ZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5oCj4gaW5kZXggMzZjNDRkOWZkZDE2Li42
NWViYmJhMjA2NjIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5l
dC5oCj4gKysrIGIvZHJpdmVycy92ZHBhL21seDUvbmV0L21seDVfdm5ldC5oCj4gQEAgLTY1LDYg
KzY1LDE1IEBAIHN0cnVjdCBtbHg1X3ZkcGFfbmV0IHsKPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IGhsaXN0X2hlYWQgbWFjdmxhbl9oYXNoW01MWDVWX01BQ1ZMQU5fU0laRV07Cj4gwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCBtbHg1X3ZkcGFfaXJxX3Bvb2wgaXJxcDsKPiDCoMKgwqDCoMKgwqDCoMKg
c3RydWN0IGRlbnRyeSAqZGVidWdmczsKPiArCj4gK8KgwqDCoMKgwqDCoMKgdTMyIHVtZW1fMV9i
dWZmZXJfcGFyYW1fYTsKPiArwqDCoMKgwqDCoMKgwqB1MzIgdW1lbV8xX2J1ZmZlcl9wYXJhbV9i
Owo+ICsKPiArwqDCoMKgwqDCoMKgwqB1MzIgdW1lbV8yX2J1ZmZlcl9wYXJhbV9hOwo+ICvCoMKg
wqDCoMKgwqDCoHUzMiB1bWVtXzJfYnVmZmVyX3BhcmFtX2I7Cj4gKwo+ICvCoMKgwqDCoMKgwqDC
oHUzMiB1bWVtXzNfYnVmZmVyX3BhcmFtX2E7Cj4gK8KgwqDCoMKgwqDCoMKgdTMyIHVtZW1fM19i
dWZmZXJfcGFyYW1fYjsKPiDCoH07Cj4gwqAKPiDCoHN0cnVjdCBtbHg1X3ZkcGFfY291bnRlciB7
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
