Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0940E7B9CE5
	for <lists.virtualization@lfdr.de>; Thu,  5 Oct 2023 14:10:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0609540C99;
	Thu,  5 Oct 2023 12:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0609540C99
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JQqrWQJo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2jspcalmBqCy; Thu,  5 Oct 2023 12:10:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7C5F140AA5;
	Thu,  5 Oct 2023 12:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C5F140AA5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0C1BC008C;
	Thu,  5 Oct 2023 12:10:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8B08C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Oct 2023 12:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A372461664
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Oct 2023 12:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A372461664
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=JQqrWQJo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2o6t2ZRgQHs
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Oct 2023 12:09:58 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A07B360F9B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Oct 2023 12:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A07B360F9B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pp2bGo7F8kJMKE7bcYRNLdbZdBF6BZEF6Z60PNdq9SKAP3iohP+jK6U4dBrZoCvsw5BqDYvZotfATqu+XnU6caZdOpVcBuDxcPryaufhkdl94HqrI6kZhC8sIAyyJfKCBElVOSMToA6Nevvyhs6A8qHVQCb0piBeMxRttIVXEI51QSZK+qBXktdvP2bpoZ1TMyq5BovJUk1vMuHVxYJkQc/PdlCrgYFW67NGjpHswy9VSfKjCGqvrpGcjidQmAA6dSZxwEdPenngRkYQda129igzunw+bUtcP4mKLFcFghpyyL+GjFtyRi1aDZSmY74WQD2GgTG6GXQ0Fc3+G4QYIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKmUIPhWZJSo7CbbctmrPh6F0Rk2rcvKFvNHBgEFfxA=;
 b=csziKFMuLYKXRl8BL9Fqku3TdrFFCXin+4hxVkb6bCgS9PbG7ZVQZAbXW0sUdNdp+w9GRiDDmuxDZ6eevh/MPB1C2/n6AiZq6mfjJGKUmeHO4oelQW/v+auQiAgmxD3T6rv8/dSjCh64m+3Di9/98w1F+Klq3Q6l4L/9Gr62r6khzzBOZpCpKshOs9AGX86vt0QVyPptq1VcoZTWuxJuA8O0poVaXkXCc+bBrlPBSlSnnrg+Y/nZdJDXAGE5NNQtL9SN6yhYcycylyrQ398Xa5EA0+snIOJ339HcGlqIsjD2zKI/Avf8GxtMNjCKjNmd1QPO07A1qgEuqMlMXYjuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKmUIPhWZJSo7CbbctmrPh6F0Rk2rcvKFvNHBgEFfxA=;
 b=JQqrWQJoAoGzQ9Bp0DPhx+iUHkI60UQ3qpObfvVLpdpxHpsEMXC9OR+7t0i3m/BkuiLKAH7QekEiUbvn82L5Avmx2ftp1/9Cb0OslAmytrnHKGx/77P7wWtyIpT6HkFExMtJRgUeyCuuC7TxO4YZGNrB9qBC5ApQmvs52Bai9/Zgo/dmoStzy+qWMFRJIJyGYrT9P7wfPVv6Blu5X5s5C4szRK2qvSHCcJ9BzRcy6ShTmqyClcZrDD6Tk6XcmwM2kPEXkUhHoB2HRXeyzMb5OfGuBPWvzKhLZwyygqHkavuFeh9VEC/Bmj6ukxaAi496iU8wU9ceRXoWHWiq3S9I9w==
Received: from DM6PR12MB5565.namprd12.prod.outlook.com (2603:10b6:5:1b6::13)
 by DM6PR12MB4942.namprd12.prod.outlook.com (2603:10b6:5:1be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.35; Thu, 5 Oct
 2023 12:09:55 +0000
Received: from DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::fddf:d4b8:44d9:d378]) by DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::fddf:d4b8:44d9:d378%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 12:09:55 +0000
To: "eperezma@redhat.com" <eperezma@redhat.com>
Subject: Re: [PATCH vhost 13/16] vdpa/mlx5: Introduce mr for vq descriptor
Thread-Topic: [PATCH vhost 13/16] vdpa/mlx5: Introduce mr for vq descriptor
Thread-Index: AQHZ8ivbW1mKsLkNk0ud6m1HpKddDLA6A8UAgAEhlgA=
Date: Thu, 5 Oct 2023 12:09:55 +0000
Message-ID: <2bf063c0e642f661ea5fe751e5c1ab736764157f.camel@nvidia.com>
References: <20230928164550.980832-2-dtatulea@nvidia.com>
 <20230928164550.980832-15-dtatulea@nvidia.com>
 <CAJaqyWfgzUYZdib2TtuJBB7qNBCoiqdHGii6w-M7m+bm8tXVhw@mail.gmail.com>
In-Reply-To: <CAJaqyWfgzUYZdib2TtuJBB7qNBCoiqdHGii6w-M7m+bm8tXVhw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5565:EE_|DM6PR12MB4942:EE_
x-ms-office365-filtering-correlation-id: 5525d637-5dc8-4223-0b06-08dbc59bfcba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /p+xMUk2+nDk66OV/upbFTdinBpPtMtpUCRA2yIhp2NZH52PJ4RooF6t5ac/CUSmIPFWZBayiMnBfaOHHXz0JVVfvvxRe4VYaX7Ax0yfVaKZ9tzNrjn/FU+ohzy6aGjPxWMmzW98hIZOGxQXGuMBJ4hbrCusID85vYeRHH6cgGlKJVzZvtrY46e0S1JEDUAF21H3bVYj4UKHR9JJqHd0kZ/olXSE4wLo+X/Lz/UIIz4Z/DGng3kNOWsLzBFOEQM4OeSFwAsejrePliv8EbpUQJnkjqCm9nceYL0dMcg+//TLpfUyEq6Au/k/h0NPQg+3PntumD5OvFNaPN0r9jVDJXIcsEtOjUVdXWtHWr1bwiLD56YcVH43D8KxMptB8WIuxM6cSQRyziWB9BSF5Xco5cqxrCAKqUqi4hBJd7uL7fFK/m582lq5hnOLlmmZlFJujXE9HCd52MbdkgJL2B6ONmVgn3LiVWNlPvz6V0okEOcktO514+D2IHUA7zTk0E6pRV+qq9dp8AZSwgxH8Jpjhaua8Ejv14/Jbp6Xcutd1BkyQWZANXMwBplQBJ7mApM0zSOQ0B9OpEh3qJ3xKOF5EYxuA3yCk3H0A+xyTPnOrMaNwrrupPzHVUftsDqizfkW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(396003)(366004)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(5660300002)(8936002)(4326008)(8676002)(41300700001)(2616005)(316002)(6916009)(66946007)(66556008)(66476007)(66446008)(54906003)(64756008)(91956017)(76116006)(66574015)(36756003)(71200400001)(6506007)(6512007)(53546011)(122000001)(38100700002)(86362001)(83380400001)(38070700005)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEpXelNJYmZZSHdPR0xwa0E0TjM2QXgyYWt0bjhRZzhWSnNYRmFqbFgvclky?=
 =?utf-8?B?anhDcXVZQzVIcU44b3FsdDJxT0VnbVF1aVdlS1RjTm02VmE4MWU3NFQwUU1T?=
 =?utf-8?B?TjZFUmpVOHV6SVllZURDNE1QQWZiclVudkV4WmxLaFNreWs2cHhzaUVIdlBU?=
 =?utf-8?B?d3RJTkFnRnNCL1hSY1ZvSC9XQUVwMzlXOG1OYnIxQTlRZm11SktRK3dlOE1X?=
 =?utf-8?B?cFZ5b2hZd3pYN0JPYXltTWxrRU9aNmRLNmJURWJDMlllWXB0ZGVWYnQyUkJ5?=
 =?utf-8?B?Q3FCRWtqdGxJbkhWZTVRY2U1SU9qTEozcHBlOW1YZmhiMWlwaFdrVTI5a1cz?=
 =?utf-8?B?V1dkSE5GYzJPblJLMGpxU1pqRkU3OWRZd24wOERhV3pTcSt2aExmTHAyMXVr?=
 =?utf-8?B?ZThzTmpMMTRJTkZ0ZkpFQ3B3c2MwZUhHbnVxUEhHU1ROOHlzME13VjFhM2hD?=
 =?utf-8?B?REpQZkVQVldObEZjWC9kR2s1UzZpaTQ1Z3BJcHR5MmhsdzlsMWY0aFgvdW5q?=
 =?utf-8?B?K2NGZXBMb25URFcyY084MWNyS1NxTFZhNEpYRTR5NmxDT25hQmtpdUQ5VzdV?=
 =?utf-8?B?aHlIZDBCYWQrTlhGYnJiQ3F1SVNWcWoxWk1IMUMxTnM5MThQd1E2MWJ2enZm?=
 =?utf-8?B?UlNUeFhiOTFoczBmRXRtZVdmWWprYnVkM00wRU9kMU84OC9URktXVW9xNS9V?=
 =?utf-8?B?d25KUURMSHAxN3Z1U3kwMGVoSW5nM0VaeU5lSE5wd2k3Z3JhOTZKWFZDZnVR?=
 =?utf-8?B?d2FDNGVEZnR6SVJMc0FTWWZrS1IyblRNcTloaTNjNVMvTmM0aUV1N2oxTnB0?=
 =?utf-8?B?SVBqeWttMFFCdkVRQ1F0Z0tTdVdOdUliZjRveWkxa2Q0SVZmdE9NR2VTT2FN?=
 =?utf-8?B?aFNrNGpNYkJCeVlIRmR1WUF1YXkxZU1xYk1nd3RkOFUwTVFjVUhVTEM5NW91?=
 =?utf-8?B?Rk5UTkdzUEZrZHRZcmtudGZyM2Y1U0lDdGdUcW5qQ1A2Y0VGMXB1QU9qV1lY?=
 =?utf-8?B?eU9QR3I1eTVBS0lHYVlYVUpPaUJPZDhMeFI2U2F4OVIvRXN6MTB6dVpIQzE5?=
 =?utf-8?B?ODZsL1BUS2FSMGdTSm5HRGNSMXIvOUR3WksrSkRDN2JGTjVCSFpEanlaeWM2?=
 =?utf-8?B?bndmRHFUbEJUclJrZDh2UzZSK1dnYzdhbVluekhPNDNOTjg1ZGRUSUx0T1pu?=
 =?utf-8?B?NWptN1NLTHErc0JYRTB3NkNQc0U0TVVpaUtzV1I3UTZRdUl4Z1JOcmlsZTU4?=
 =?utf-8?B?VEd2U0YzZFR1TDdHMFJQY3FYOUNVaVBCWEZ3US96UlA0ZWNjdFY3NkMxUXh1?=
 =?utf-8?B?S1pPYUlOZG9UR0h3SlN6eHNEZDNjZEl1STdBSGRPeWMvdkVyWFNZa1IvTk5D?=
 =?utf-8?B?ZW8reHI1cXV5YlRLUlNkbFhoNGRJWGgvdUxPMFRRSGFFVjlPVkNrRjI5aGVa?=
 =?utf-8?B?WVo1UFpBSGFSOE53KzVlUXJ1MWg5UDhuMCtqbkdUYkJHYUh3SVhvWUs4R01h?=
 =?utf-8?B?ZlFxNFAvOTV1T2hjbmpCeHB1Zmk4Vy9ORnllTVRSM042OVh6bGRZekVQNDhu?=
 =?utf-8?B?UW5jbFhnTGhkK2lKcmd5MlhCdnJ6Z1FMMkZWdEhZY2FUNEVOQk9waForRVV6?=
 =?utf-8?B?MTN6SDIySWxkZGM1M0UzamNNV3lzNzUzR1Ard0xDYWJ6WEo2cFZqSXk3a0g2?=
 =?utf-8?B?dFhxUURjazBnQ2ZSRXgxaWhsbDBIc2ZISkZRNHZieHBEajJzRHo5K2MwUnlK?=
 =?utf-8?B?b1hBSUpSQXVjdk12Y1BPdVVHcERacW42NlNnNk51bE5BdEcyMkZscVptK0Ry?=
 =?utf-8?B?UGcrdW0yYVkrSVkvTmh2b1hTVVlUMlp3YSs0S0xuSkUvRVNDNWdKUnE0aWkw?=
 =?utf-8?B?cDVmU3VDUE1uWXBVZlIxNmNEOVJvdUpyWEVNdzlicnZlbkJ2MUxRZnBwZEVi?=
 =?utf-8?B?dUZlcFo2TGY5SG9uVWx2eGVmWUc3bzZuV0RFQTI1QVNzOStZY2VjdThiZFor?=
 =?utf-8?B?S0dnZVdDMFNweVZWaUQ0NFBTWFIvNXpJSHVyaXllMktyYzBFdXJCb0FwN1Qv?=
 =?utf-8?B?b25JenAvWTVuL21JVm5aNWh1ZEI3d0IzSTliRmt2dzV4dVlZY0NVL0pvN1Z6?=
 =?utf-8?B?M1crQ21Dajg3T2xHMlVJUGc0UTk1ckhPTHBGSk5vTTByeWM5MFhZUGZkYllG?=
 =?utf-8?Q?0cOQA7+GCCqbPoz53Qdq8/bcRua84gQKamEAT9KYV9Cz?=
Content-ID: <2F86F77CDCABA04CB728C2F55F4AA5FA@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5525d637-5dc8-4223-0b06-08dbc59bfcba
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 12:09:55.3335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sF+oh3VDdHYswSTvUCWYdda7tQVhC4xLUUooe3432APMt4t59MQYi8TFZnjega5jIJSfbPoLIoHQI9OPsraARg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4942
Cc: "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Gal Pressman <gal@nvidia.com>
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

T24gV2VkLCAyMDIzLTEwLTA0IGF0IDIwOjUzICswMjAwLCBFdWdlbmlvIFBlcmV6IE1hcnRpbiB3
cm90ZToKPiBPbiBUaHUsIFNlcCAyOCwgMjAyMyBhdCA2OjUw4oCvUE0gRHJhZ29zIFRhdHVsZWEg
PGR0YXR1bGVhQG52aWRpYS5jb20+IHdyb3RlOgo+ID4gCj4gPiBJbnRyb2R1Y2UgdGhlIHZxIGRl
c2NyaXB0b3IgZ3JvdXAgYW5kIEFTSUQgMS4gVW50aWwgbm93IC5zZXRfbWFwIG9uIEFTSUQKPiAK
PiBzL0FTSUQvdnEgZ3JvdXAvPwo+IApPaCwgaW5kZWVkLgoKPiA+IDEgd2FzIG9ubHkgdXBkYXRp
bmcgdGhlIGN2cSBpb3RsYi4gRnJvbSBub3cgb24gaXQgYWxzbyBjcmVhdGVzIGEgbWtleQo+ID4g
Zm9yIGl0LiBUaGUgY3VycmVudCBwYXRjaCBkb2Vzbid0IHVzZSBpdCBidXQgZm9sbG93LXVwIHBh
dGNoZXMgd2lsbAo+ID4gYWRkIGhhcmR3YXJlIHN1cHBvcnQgZm9yIG1hcHBpbmcgdGhlIHZxIGRl
c2NyaXB0b3JzLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBEcmFnb3MgVGF0dWxlYSA8ZHRhdHVs
ZWFAbnZpZGlhLmNvbT4KPiA+IC0tLQo+ID4gwqBkcml2ZXJzL3ZkcGEvbWx4NS9jb3JlL21seDVf
dmRwYS5oIHzCoCA1ICsrKy0tCj4gPiDCoGRyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbXIuY8KgwqDC
oMKgwqDCoMKgIHwgMTQgKysrKysrKysrLS0tLS0KPiA+IMKgZHJpdmVycy92ZHBhL21seDUvbmV0
L21seDVfdm5ldC5jwqAgfCAyMCArKysrKysrKysrKysrLS0tLS0tLQo+ID4gwqAzIGZpbGVzIGNo
YW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92ZHBhL21seDUvY29yZS9tbHg1X3ZkcGEuaAo+ID4gYi9kcml2ZXJzL3Zk
cGEvbWx4NS9jb3JlL21seDVfdmRwYS5oCj4gPiBpbmRleCBiYmU0MzM1MTA2YmQuLmFlMDkyOTZm
NDI3MCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbWx4NV92ZHBhLmgK
PiA+ICsrKyBiL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbWx4NV92ZHBhLmgKPiA+IEBAIC03MCwx
MSArNzAsMTIgQEAgc3RydWN0IG1seDVfdmRwYV93cV9lbnQgewo+ID4gwqBlbnVtIHsKPiA+IMKg
wqDCoMKgwqDCoMKgIE1MWDVfVkRQQV9EQVRBVlFfR1JPVVAsCj4gPiDCoMKgwqDCoMKgwqDCoCBN
TFg1X1ZEUEFfQ1ZRX0dST1VQLAo+ID4gK8KgwqDCoMKgwqDCoCBNTFg1X1ZEUEFfREFUQVZRX0RF
U0NfR1JPVVAsCj4gPiDCoMKgwqDCoMKgwqDCoCBNTFg1X1ZEUEFfTlVNVlFfR1JPVVBTCj4gPiDC
oH07Cj4gPiAKPiA+IMKgZW51bSB7Cj4gPiAtwqDCoMKgwqDCoMKgIE1MWDVfVkRQQV9OVU1fQVMg
PSBNTFg1X1ZEUEFfTlVNVlFfR1JPVVBTCj4gPiArwqDCoMKgwqDCoMKgIE1MWDVfVkRQQV9OVU1f
QVMgPSAyCj4gPiDCoH07Cj4gPiAKPiA+IMKgc3RydWN0IG1seDVfdmRwYV9kZXYgewo+ID4gQEAg
LTg5LDcgKzkwLDcgQEAgc3RydWN0IG1seDVfdmRwYV9kZXYgewo+ID4gwqDCoMKgwqDCoMKgwqAg
dTE2IG1heF9pZHg7Cj4gPiDCoMKgwqDCoMKgwqDCoCB1MzIgZ2VuZXJhdGlvbjsKPiA+IAo+ID4g
LcKgwqDCoMKgwqDCoCBzdHJ1Y3QgbWx4NV92ZHBhX21yICptcjsKPiA+ICvCoMKgwqDCoMKgwqAg
c3RydWN0IG1seDVfdmRwYV9tciAqbXJbTUxYNV9WRFBBX05VTV9BU107Cj4gCj4gSSdtIHdvbmRl
cmluZyBpZiBpdCBtYWtlcyBzZW5zZSB0byBzcXVhc2ggYWxsIG9mIHRoaXMgcGF0Y2ggd2l0aCB0
aGUKPiBwcmV2aW91cyBvbmUsIGFzIEkgdGhpbmsgKm1yW01MWDVfVkRQQV9OVU1fQVNdIG1ha2Vz
IHdheSBtb3JlIHNlbnNlCj4gdGhhbiBqdXN0ICptci4KPiAKSSd2ZSBiZWVuIG9uIHRoZSBmZW5j
ZSBhYm91dCB0aGlzIG9uZS4gSXQgc2VlbWVkIGNsZWFuZXIgdG8gaGF2ZSB0d28gcGF0Y2hlcy4K
Cj4gV2hhdGV2ZXIgeW91IGNob29zZSwgZm9yIGJvdGggcGF0Y2hlczoKPiAKPiBBY2tlZC1ieTog
RXVnZW5pbyBQw6lyZXogPGVwZXJlem1hQHJlZGhhdC5jb20+Cj4gCj4gPiDCoMKgwqDCoMKgwqDC
oCAvKiBzZXJpYWxpemUgbXIgYWNjZXNzICovCj4gPiDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgbXV0
ZXggbXJfbXR4Owo+ID4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IG1seDVfY29udHJvbF92cSBjdnE7
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL21seDUvY29yZS9tci5jIGIvZHJpdmVycy92
ZHBhL21seDUvY29yZS9tci5jCj4gPiBpbmRleCAwMGVmZjVhMDcxNTIuLjNkZWU2ZDliZWQ2YiAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdmRwYS9tbHg1L2NvcmUvbXIuYwo+ID4gKysrIGIvZHJp
dmVycy92ZHBhL21seDUvY29yZS9tci5jCj4gPiBAQCAtNTExLDggKzUxMSwxMCBAQCB2b2lkIG1s
eDVfdmRwYV9kZXN0cm95X21yKHN0cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwKPiA+IAo+ID4g
wqDCoMKgwqDCoMKgwqAgX21seDVfdmRwYV9kZXN0cm95X21yKG12ZGV2LCBtcik7Cj4gPiAKPiA+
IC3CoMKgwqDCoMKgwqAgaWYgKG12ZGV2LT5tciA9PSBtcikKPiA+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG12ZGV2LT5tciA9IE5VTEw7Cj4gPiArwqDCoMKgwqDCoMKgIGZvciAoaW50
IGkgPSAwOyBpIDwgTUxYNV9WRFBBX05VTV9BUzsgaSsrKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAobXZkZXYtPm1yW2ldID09IG1yKQo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG12ZGV2LT5tcltpXSA9IE5VTEw7Cj4gPiAr
wqDCoMKgwqDCoMKgIH0KPiA+IAo+ID4gwqDCoMKgwqDCoMKgwqAgbXV0ZXhfdW5sb2NrKCZtdmRl
di0+bXJfbXR4KTsKPiA+IAo+ID4gQEAgLTUyMywxMSArNTI1LDExIEBAIHZvaWQgbWx4NV92ZHBh
X3VwZGF0ZV9tcihzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IG1seDVfdmRwYV9tciAq
bmV3X21yLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHVuc2lnbmVkIGludCBhc2lkKQo+ID4gwqB7Cj4gPiAtwqDCoMKgwqDCoMKgIHN0cnVjdCBt
bHg1X3ZkcGFfbXIgKm9sZF9tciA9IG12ZGV2LT5tcjsKPiA+ICvCoMKgwqDCoMKgwqAgc3RydWN0
IG1seDVfdmRwYV9tciAqb2xkX21yID0gbXZkZXYtPm1yW2FzaWRdOwo+ID4gCj4gPiDCoMKgwqDC
oMKgwqDCoCBtdXRleF9sb2NrKCZtdmRldi0+bXJfbXR4KTsKPiA+IAo+ID4gLcKgwqDCoMKgwqDC
oCBtdmRldi0+bXIgPSBuZXdfbXI7Cj4gPiArwqDCoMKgwqDCoMKgIG12ZGV2LT5tclthc2lkXSA9
IG5ld19tcjsKPiA+IMKgwqDCoMKgwqDCoMKgIGlmIChvbGRfbXIpIHsKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBfbWx4NV92ZHBhX2Rlc3Ryb3lfbXIobXZkZXYsIG9sZF9tcik7
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga2ZyZWUob2xkX21yKTsKPiA+IEBA
IC01MzksNyArNTQxLDkgQEAgdm9pZCBtbHg1X3ZkcGFfdXBkYXRlX21yKHN0cnVjdCBtbHg1X3Zk
cGFfZGV2ICptdmRldiwKPiA+IAo+ID4gwqB2b2lkIG1seDVfdmRwYV9kZXN0cm95X21yX3Jlc291
cmNlcyhzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYpCj4gPiDCoHsKPiA+IC3CoMKgwqDCoMKg
wqAgbWx4NV92ZHBhX2Rlc3Ryb3lfbXIobXZkZXYsIG12ZGV2LT5tcik7Cj4gPiArwqDCoMKgwqDC
oMKgIGZvciAoaW50IGkgPSAwOyBpIDwgTUxYNV9WRFBBX05VTV9BUzsgaSsrKQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWx4NV92ZHBhX2Rlc3Ryb3lfbXIobXZkZXYsIG12ZGV2
LT5tcltpXSk7Cj4gPiArCj4gPiDCoMKgwqDCoMKgwqDCoCBwcnVuZV9pb3RsYihtdmRldik7Cj4g
PiDCoH0KPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3Zu
ZXQuYwo+ID4gYi9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMKPiA+IGluZGV4IDRh
ODdmOTExOWZjYS4uMjViZDJjMzI0ZjViIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy92ZHBhL21s
eDUvbmV0L21seDVfdm5ldC5jCj4gPiArKysgYi9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92
bmV0LmMKPiA+IEBAIC04MjEsNiArODIxLDggQEAgc3RhdGljIGludCBjcmVhdGVfdmlydHF1ZXVl
KHN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpuZGV2LAo+ID4gc3RydWN0IG1seDVfdmRwYV92aXJ0cXVl
Cj4gPiDCoHsKPiA+IMKgwqDCoMKgwqDCoMKgIGludCBpbmxlbiA9IE1MWDVfU1RfU1pfQllURVMo
Y3JlYXRlX3ZpcnRpb19uZXRfcV9pbik7Cj4gPiDCoMKgwqDCoMKgwqDCoCB1MzIgb3V0W01MWDVf
U1RfU1pfRFcoY3JlYXRlX3ZpcnRpb19uZXRfcV9vdXQpXSA9IHt9Owo+ID4gK8KgwqDCoMKgwqDC
oCBzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYgPSAmbmRldi0+bXZkZXY7Cj4gPiArwqDCoMKg
wqDCoMKgIHN0cnVjdCBtbHg1X3ZkcGFfbXIgKnZxX21yOwo+ID4gwqDCoMKgwqDCoMKgwqAgdm9p
ZCAqb2JqX2NvbnRleHQ7Cj4gPiDCoMKgwqDCoMKgwqDCoCB1MTYgbWx4X2ZlYXR1cmVzOwo+ID4g
wqDCoMKgwqDCoMKgwqAgdm9pZCAqY21kX2hkcjsKPiA+IEBAIC04NzMsNyArODc1LDkgQEAgc3Rh
dGljIGludCBjcmVhdGVfdmlydHF1ZXVlKHN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpuZGV2LAo+ID4g
c3RydWN0IG1seDVfdmRwYV92aXJ0cXVlCj4gPiDCoMKgwqDCoMKgwqDCoCBNTFg1X1NFVDY0KHZp
cnRpb19xLCB2cV9jdHgsIGRlc2NfYWRkciwgbXZxLT5kZXNjX2FkZHIpOwo+ID4gwqDCoMKgwqDC
oMKgwqAgTUxYNV9TRVQ2NCh2aXJ0aW9fcSwgdnFfY3R4LCB1c2VkX2FkZHIsIG12cS0+ZGV2aWNl
X2FkZHIpOwo+ID4gwqDCoMKgwqDCoMKgwqAgTUxYNV9TRVQ2NCh2aXJ0aW9fcSwgdnFfY3R4LCBh
dmFpbGFibGVfYWRkciwgbXZxLT5kcml2ZXJfYWRkcik7Cj4gPiAtwqDCoMKgwqDCoMKgIE1MWDVf
U0VUKHZpcnRpb19xLCB2cV9jdHgsIHZpcnRpb19xX21rZXksIG5kZXYtPm12ZGV2Lm1yLT5ta2V5
KTsKPiA+ICvCoMKgwqDCoMKgwqAgdnFfbXIgPSBtdmRldi0+bXJbbXZkZXYtPmdyb3VwMmFzaWRb
TUxYNV9WRFBBX0RBVEFWUV9HUk9VUF1dOwo+ID4gK8KgwqDCoMKgwqDCoCBpZiAodnFfbXIpCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBNTFg1X1NFVCh2aXJ0aW9fcSwgdnFfY3R4
LCB2aXJ0aW9fcV9ta2V5LCB2cV9tci0+bWtleSk7Cj4gPiDCoMKgwqDCoMKgwqDCoCBNTFg1X1NF
VCh2aXJ0aW9fcSwgdnFfY3R4LCB1bWVtXzFfaWQsIG12cS0+dW1lbTEuaWQpOwo+ID4gwqDCoMKg
wqDCoMKgwqAgTUxYNV9TRVQodmlydGlvX3EsIHZxX2N0eCwgdW1lbV8xX3NpemUsIG12cS0+dW1l
bTEuc2l6ZSk7Cj4gPiDCoMKgwqDCoMKgwqDCoCBNTFg1X1NFVCh2aXJ0aW9fcSwgdnFfY3R4LCB1
bWVtXzJfaWQsIG12cS0+dW1lbTIuaWQpOwo+ID4gQEAgLTI2MzMsNyArMjYzNyw4IEBAIHN0YXRp
YyB2b2lkIHJlc3RvcmVfY2hhbm5lbHNfaW5mbyhzdHJ1Y3QgbWx4NV92ZHBhX25ldAo+ID4gKm5k
ZXYpCj4gPiDCoH0KPiA+IAo+ID4gwqBzdGF0aWMgaW50IG1seDVfdmRwYV9jaGFuZ2VfbWFwKHN0
cnVjdCBtbHg1X3ZkcGFfZGV2ICptdmRldiwKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IG1seDVfdmRwYV9tciAq
bmV3X21yLCB1bnNpZ25lZCBpbnQKPiA+IGFzaWQpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBtbHg1X3ZkcGFf
bXIgKm5ld19tciwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGFzaWQpCj4gPiDCoHsKPiA+IMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBtbHg1X3ZkcGFfbmV0ICpuZGV2ID0gdG9fbWx4NV92ZHBhX25kZXYo
bXZkZXYpOwo+ID4gwqDCoMKgwqDCoMKgwqAgaW50IGVycjsKPiA+IEBAIC0yNjUyLDggKzI2NTcs
MTAgQEAgc3RhdGljIGludCBtbHg1X3ZkcGFfY2hhbmdlX21hcChzdHJ1Y3QgbWx4NV92ZHBhX2Rl
dgo+ID4gKm12ZGV2LAo+ID4gCj4gPiDCoMKgwqDCoMKgwqDCoCByZXN0b3JlX2NoYW5uZWxzX2lu
Zm8obmRldik7Cj4gPiDCoMKgwqDCoMKgwqDCoCBlcnIgPSBzZXR1cF9kcml2ZXIobXZkZXYpOwo+
ID4gK8KgwqDCoMKgwqDCoCBpZiAoZXJyKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIGVycjsKPiA+IAo+ID4gLcKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+ID4gK8Kg
wqDCoMKgwqDCoCByZXR1cm4gMDsKPiA+IMKgfQo+ID4gCj4gPiDCoC8qIHJlc2xvY2sgbXVzdCBi
ZSBoZWxkIGZvciB0aGlzIGZ1bmN0aW9uICovCj4gPiBAQCAtMjg2OSw4ICsyODc2LDggQEAgc3Rh
dGljIGludCBzZXRfbWFwX2RhdGEoc3RydWN0IG1seDVfdmRwYV9kZXYgKm12ZGV2LAo+ID4gc3Ry
dWN0IHZob3N0X2lvdGxiICppb3RsYiwKPiA+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBtbHg1X3Zk
cGFfbXIgKm5ld19tcjsKPiA+IMKgwqDCoMKgwqDCoMKgIGludCBlcnI7Cj4gPiAKPiA+IC3CoMKg
wqDCoMKgwqAgaWYgKG12ZGV2LT5ncm91cDJhc2lkW01MWDVfVkRQQV9EQVRBVlFfR1JPVVBdICE9
IGFzaWQpCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVuZDsKPiA+ICvC
oMKgwqDCoMKgwqAgaWYgKGFzaWQgPj0gTUxYNV9WRFBBX05VTV9BUykKPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+ID4gCj4gPiDCoMKgwqDCoMKgwqDC
oCBuZXdfbXIgPSBtbHg1X3ZkcGFfY3JlYXRlX21yKG12ZGV2LCBpb3RsYik7Cj4gPiDCoMKgwqDC
oMKgwqDCoCBpZiAoSVNfRVJSKG5ld19tcikpIHsKPiA+IEBAIC0yODc5LDcgKzI4ODYsNyBAQCBz
dGF0aWMgaW50IHNldF9tYXBfZGF0YShzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsCj4gPiBz
dHJ1Y3Qgdmhvc3RfaW90bGIgKmlvdGxiLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiBlcnI7Cj4gPiDCoMKgwqDCoMKgwqDCoCB9Cj4gPiAKPiA+IC3CoMKgwqDCoMKg
wqAgaWYgKCFtdmRldi0+bXIpIHsKPiA+ICvCoMKgwqDCoMKgwqAgaWYgKCFtdmRldi0+bXJbYXNp
ZF0pIHsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtbHg1X3ZkcGFfdXBkYXRl
X21yKG12ZGV2LCBuZXdfbXIsIGFzaWQpOwo+ID4gwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSBtbHg1X3ZkcGFfY2hhbmdlX21h
cChtdmRldiwgbmV3X21yLCBhc2lkKTsKPiA+IEBAIC0yODg5LDcgKzI4OTYsNiBAQCBzdGF0aWMg
aW50IHNldF9tYXBfZGF0YShzdHJ1Y3QgbWx4NV92ZHBhX2RldiAqbXZkZXYsCj4gPiBzdHJ1Y3Qg
dmhvc3RfaW90bGIgKmlvdGxiLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0K
PiA+IMKgwqDCoMKgwqDCoMKgIH0KPiA+IAo+ID4gLWVuZDoKPiA+IMKgwqDCoMKgwqDCoMKgIHJl
dHVybiBtbHg1X3ZkcGFfdXBkYXRlX2N2cV9pb3RsYihtdmRldiwgaW90bGIsIGFzaWQpOwo+ID4g
Cj4gPiDCoG91dF9lcnI6Cj4gPiAtLQo+ID4gMi40MS4wCj4gPiAKPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
