Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B8676AAB7
	for <lists.virtualization@lfdr.de>; Tue,  1 Aug 2023 10:17:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D95760F2C;
	Tue,  1 Aug 2023 08:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D95760F2C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=thBvOYy/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VVMte2Am940W; Tue,  1 Aug 2023 08:17:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0735D60F03;
	Tue,  1 Aug 2023 08:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0735D60F03
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C02FC0DD4;
	Tue,  1 Aug 2023 08:17:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7DF9C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Aug 2023 08:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABFCE60E64
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Aug 2023 08:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABFCE60E64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bHGmkTI0ANnh
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Aug 2023 08:17:32 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::604])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E84260E17
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Aug 2023 08:17:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E84260E17
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDrRZ2Yn+WxVYDo/5nrb5LM1/LCc/E1u7axnBDceo5YcJoCzd469Z8Beqa9a6vhwKTRLPBbR+LVYKbzWa1QVikEbpvSHaLf9WtzImsh76e2A9DMmQY/Z+GdLqyHnZJhvdAup8nnX2jGhKjfx0PpRkA6SnUgLg/GLl55k3wHJBD0Q1BUfEtxn9x+daCN+LdV3wCT61iLnVYnJu9hoim3zKHbs8KYWA0MyvVzpvYmWKrfLwtkd1dCIYakfGVQjyZsMQ4NkmxzLiIHtOKJSC71oSo7QPAytfUs2hDv3e/kItq4XdILov/gjyT1KHUaR1urWDh8TTSJrngkvtKtvgzpz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkfmeE9RmUsxvN3XzwBMiRwzJbtI6inYrJjy670maj0=;
 b=FxoF2xX+kRukPx0kvpWNMvEzvAuWYCdvMO+s45Osisx4NnXUdwswQgTDhcIZ27L06EHQBOydoVzZRCXIRjVe47IGgvqI7+/xmyT8/s4vVYxa/Ni5dnbLAkNMGKYhp1uktNNb7XltasBkFLe8PFRbuEna0kFFyD242h3aLGvX0+LCtgL8meouu0Pn/qra53Wpi18l9R1T0fPZb2ujBecf9Re1zRy19nfn4JywAqSJTYAm2b5C2eRs5Tzog0VHEYMyVhLJMh/kVyEqxGzLgZOta3u6dMC/Mh+Z4ah5zYKhFWt4aE/O5JFs9P2Yt2wIb1+K3O2Qgc0HB6ANdPp03/wepg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkfmeE9RmUsxvN3XzwBMiRwzJbtI6inYrJjy670maj0=;
 b=thBvOYy/oX+yM1cBqw0KmVckKRP0JbVYl/3x580siHwHqHv5OfTp2ztw4feovU2ose8T2YBO3GWrBrRxOFygo0LOpJ2KbZR8OHGicLiJY9xVx8o+CFvuFR9A5FIRv2BP0wPN6uA9sfCseRV+2TnHs+HSSsWAPGxLfVXzJIM/SenSo11jHg6/5AGzXaN5+47nfhPER0ajz6+rdVz6f2ZYPWV/2a9RmhwDXr2HawqRyPOROVKpME+rH9AO8JFg0KUMN7yvvc/h1CtUbjQj/HnbcVeXILGXGacUexgTM1MgjpX06hJrqIhaesgNe493yVHTuhmKRQE2PRd02vTm+9CuYA==
Received: from DM6PR12MB5565.namprd12.prod.outlook.com (2603:10b6:5:1b6::13)
 by BY5PR12MB4934.namprd12.prod.outlook.com (2603:10b6:a03:1db::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 08:17:29 +0000
Received: from DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667]) by DM6PR12MB5565.namprd12.prod.outlook.com
 ([fe80::40dc:9f89:895c:8667%4]) with mapi id 15.20.6631.043; Tue, 1 Aug 2023
 08:17:29 +0000
To: "jasowang@redhat.com" <jasowang@redhat.com>, "mst@redhat.com"
 <mst@redhat.com>
Subject: Re: [PATCH] vdpa/mlx5: Fix crash on shutdown for when no ndev exists
Thread-Topic: [PATCH] vdpa/mlx5: Fix crash on shutdown for when no ndev exists
Thread-Index: AQHZv/SESZp4mdZfpESAhZmcsTYGMq/Mbh0AgAFZZYCAAAdcgIAFrswAgAAfgICAATv0gIAASDEA
Date: Tue, 1 Aug 2023 08:17:29 +0000
Message-ID: <39c3be5dd59e67e7b5dd301100e96aa9428bc332.camel@nvidia.com>
References: <20230726190744.14143-1-dtatulea@nvidia.com>
 <20230726152258-mutt-send-email-mst@kernel.org>
 <3ae9e8919a9316d06d7bb507698c820ac6194f45.camel@nvidia.com>
 <20230727122633-mutt-send-email-mst@kernel.org>
 <b97484f15824c86f5cee4fe673794f17419bcb1b.camel@nvidia.com>
 <20230731050200-mutt-send-email-mst@kernel.org>
 <CACGkMEtiwNjq4pMVY-Yvgo3+DihMP5zO+q+HH-xAF+Xu_=gbHg@mail.gmail.com>
In-Reply-To: <CACGkMEtiwNjq4pMVY-Yvgo3+DihMP5zO+q+HH-xAF+Xu_=gbHg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.4 (3.48.4-1.fc38) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB5565:EE_|BY5PR12MB4934:EE_
x-ms-office365-filtering-correlation-id: 2dcac8b2-9faa-4900-504e-08db9267bf6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: slHWHA6ySOQ5flABUreH499Fhnhb9E8gD7lmSzoZLHFvf72L0hR3hcZUDiZRb91YtoCx7sHWHxe1Dij7oWL5R/aHL6eJbXRo6NLsfcbwmDE4eD6ch8e2pTjg1DWIQmo8GPdObNXKA9HuNQ1tNtgJ3ESJGEUmFutqP+OiH2jeGJ1dPBbtH0UaO07xQX5RbdnoNHkMqUW3NcnuYnLHRUyIIko/hbYcqyZzRckUdMVCLgrQNn8Bgv0fwywQizQShXyat5CZF44Wj7qWier0SfWbVc6l6U/3oRMkcMS17gjp54BbMiCI36hu6fahZVr9Ac0eCwLX7ez7lkAGnuo20AkM1njMniOvo+y3ezU/8JS61d31DTpD17gyEHzrMjF9gVFhxhIh+c0L9D1eX8i8X5fxI47NNIhCzRfF3rtwIDyzHknVeTcKoZTGogmLQhsAPHqt/y005W7TMP85hKLb4Z8nQh16ER7IZ2ipoYR97xJOauyvvN47sjFxvSKd7n9w7dX+OjrVFvSrWhy+fF+MiNPm9amnr8tCKw7oGfmRiWVBulmS93cRbr3NWZkuF6EtoHKzbpLHlEMmRRIewOjJviisREM1GIteG1PIUyA9DwToaQHLHH+cM9c0GBm9amEOxNcFyPOkZawYxul1hP100Avlpw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5565.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(451199021)(966005)(6512007)(6486002)(36756003)(2616005)(53546011)(6506007)(83380400001)(186003)(76116006)(66946007)(66556008)(91956017)(54906003)(110136005)(122000001)(38070700005)(41300700001)(38100700002)(86362001)(66476007)(316002)(5660300002)(66446008)(4326008)(8676002)(8936002)(64756008)(2906002)(71200400001)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFExMkVBdXFoc2dKcDc4WGlsTzlnSVA4Rnk3YmVuUG0ya2VrSTcxcDdYbkho?=
 =?utf-8?B?U2VhYVRSc2lzR25VME1jaXBtVi9FSEl6dkZzK3RHUkRjMkVVZDF2WVJtRUhW?=
 =?utf-8?B?QlBjbUVxSlE3Wk9TeEh4MUM5eU1SRkhZakw4Y05lUmZWR0pSTHRkK1d3QXZi?=
 =?utf-8?B?aTdBZjAxc1ZBVUFycGVlVU5hamtVbGRNOW95d1hvcEFHV0xNc05CTkRwZ3ps?=
 =?utf-8?B?eUNvaE4zdE1hWGxwVGpwcWhOSXhYRy95VWVtN1JiMHg1T2lMTWUxVFRzY0dX?=
 =?utf-8?B?cTR5QmRwSjlZU0xxelRWNVNFR1Z3U1kzaVdIcExEWnMrdU5ObkRLMklHbHdV?=
 =?utf-8?B?SDRSL1k2S0pXSFZTU1k2azNWRWYvMnV1enl6cTRiNzVpSE94dVdXcWhvY21T?=
 =?utf-8?B?OGJkQ09rVm1sRGw2RHRGOXZVOG52RTlFZXBQM1psSkZzUlQ2Y1RTTTQreFlo?=
 =?utf-8?B?Y2tvWEJJLzNPcS9HNWhUVGVZT2VXakwxYnhWcDNKeVA2TE9qdkJPREEyaHFa?=
 =?utf-8?B?N1h4czB1V3lkQ01ES1pkVTBxTEdrbW8rZGJSSlZDUG5hRE5zLzNUektGbWs2?=
 =?utf-8?B?bURKSERjaS90bEI2dGNTWG9nczdJYkJZanFrcU9wdk5MaFFBRWJkaERhbEhj?=
 =?utf-8?B?c09BY3lreUkwU1hKblVoWERZQjB1Q2w4QXB4V0pTemlSYlJ6Nm5LMi9uQUZX?=
 =?utf-8?B?V3lTM1pDbk1BbjdoVEtKREVDY3dubjY5OG5iaCtzcUdxaGNYMnZINm1TT1F3?=
 =?utf-8?B?K0J0SE9uellzMVVJSllVUzRzaEI2NUlwVmlBL0JkOTBBTlQxMU9mMnhLZEl1?=
 =?utf-8?B?eTZscjRhNzNka0pGeklWai9nbDFidFJIbWFrd1ZxRk5Sb1J6QWhOanhiZXgz?=
 =?utf-8?B?RXpSRW1kcnZkankzbVpPZ21iM1ZBNHJoY0hna0hpVGpkbmpTa2ZPV0swZS9s?=
 =?utf-8?B?cHVTVEl6c0JIY09OQlhvaEEzVFZrUXRURTZ3OXg0bzB4ZFhtcTlxZ2c2N3RH?=
 =?utf-8?B?VFR4R3NtSGE1TjlWajZUdktLTzV1M1lTWUV4VEpJSCtVQTlHZXk3dUExRWJC?=
 =?utf-8?B?KzVnUjN4SGpRblZRZHpKTWVwY1hsZmJMRmtuVjVBZDlWSDcyOVNIVXQvSHNu?=
 =?utf-8?B?ZnZTSDZ6Y2lMVUQxYU5pdDdDcWZCV2xpYW5ZVHlmYjQ1ZHNqWkdTS3J2U2ZC?=
 =?utf-8?B?SWFaSnBhZVJaKzVKZUIxYmlGUXBPUW00ZXQ3WVNTcEdZMEtqMERTZWFZaTN0?=
 =?utf-8?B?VnhLKy8zdmdPcmtuWlBjNUpJd2FRdHk0K0trRHhHVGs1Y2pOMURkZjV4MWo5?=
 =?utf-8?B?aXZhSUxGTzk5ZzlHb3BOdlJ1SHF2enNWWlhUODl2Y1EzVWZvYmFEck0rWUho?=
 =?utf-8?B?ZnBMYnBzNzM0REhjdUVLYUYyOVJsUFFQYWFrTlBUL2NYVGNiY1hPWHVFWCtE?=
 =?utf-8?B?QTJPMjlNSVlwVVZVZWs2MVpNUE0xS1NDdVVmY0dLRFVVTWZ4RDBJMFVTY2Fj?=
 =?utf-8?B?eExwZWQyVXRudGlycUFtWGZ5akxtcjJnVWVuNTVJR0U5OGZCSnNJcWh1b2Zp?=
 =?utf-8?B?enFwT0VFTzBQK3BnZmVTTTVFZkh5UEJrQitiaU14Q0JrMGlqZkJoZ0dFRGMw?=
 =?utf-8?B?RHZpU3RZQTlPWGxYYkxHUlhKbXhIRUI1ZmoyVDJXN2ZQYktvQ3FRclEzNm00?=
 =?utf-8?B?VEJkeVZnamVpNC9xNEJBYS94RHVJaFk5ZENYSlJoUG5vT1dnbkpkQXVlV2lp?=
 =?utf-8?B?MjQ5SVk5cGRWUFhlWUZRYmlHdVBQaHdKdHRyVjJsS1A3WTFYQkdzWnVOWDY1?=
 =?utf-8?B?aGFjSGxBZlR5K3g4eHNrMWFEMHpQUjExd1pEaHkrTGN5bDlCODgxK0V4ZkhB?=
 =?utf-8?B?ZFB4dzZTTk9USXp3WmV5K0lLK3BJU2ZkSG5zSVlYYzQ5ZWhXRURqWjd2QVFB?=
 =?utf-8?B?U0VWQ2VOVHVkVGI3emZUR0EwYjN3cW14V0pTZmM1bVl3NjFSUWZWTytoRTNC?=
 =?utf-8?B?VW5lMUhoU3ZBTGJUbWxUd2hHOStDd3ZoN0RnazExUmlvOTNWbWJ1MythM3ZQ?=
 =?utf-8?B?NXhlN2NSNVZYbEloNVFQVjNWRWtXRDJJdGdmaUcwaVZxcW9abk9NVnVBczBo?=
 =?utf-8?B?ODNlUVVNWDZEK2U5Tk1RaEF2TEV0OGovb1BtNXRSVlBsVk9XbHNDTVcwRVYv?=
 =?utf-8?Q?pu3QSJgICIhrLfo14Yd2bArKuOyO7lkmBsO15Lhx7k8T?=
Content-ID: <90839D4C009543449EB409EA4810EF38@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5565.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcac8b2-9faa-4900-504e-08db9267bf6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 08:17:29.3712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W8MdRC1gyPqS3BFpdxaaCYS9Th5+aMI6C2q9QO277dlXLZE0rh0C7rfly5p0JEQj58h4/y7KLA9hEN76wfkDEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4934
Cc: "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 Saeed Mahameed <saeedm@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
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

T24gVHVlLCAyMDIzLTA4LTAxIGF0IDExOjU5ICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOg0KPiBP
biBNb24sIEp1bCAzMSwgMjAyMyBhdCA1OjA44oCvUE0gTWljaGFlbCBTLiBUc2lya2luIDxtc3RA
cmVkaGF0LmNvbT4gd3JvdGU6DQo+ID4gDQo+ID4gT24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgMDc6
MTU6MzFBTSArMDAwMCwgRHJhZ29zIFRhdHVsZWEgd3JvdGU6DQo+ID4gPiBPbiBUaHUsIDIwMjMt
MDctMjcgYXQgMTI6MjggLTA0MDAsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToNCj4gPiA+ID4g
T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMDQ6MDI6MTZQTSArMDAwMCwgRHJhZ29zIFRhdHVsZWEg
d3JvdGU6DQo+ID4gPiA+ID4gT24gV2VkLCAyMDIzLTA3LTI2IGF0IDE1OjI2IC0wNDAwLCBNaWNo
YWVsIFMuIFRzaXJraW4gd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiBXZWQsIEp1bCAyNiwgMjAyMyBh
dCAxMDowNzozOFBNICswMzAwLCBEcmFnb3MgVGF0dWxlYSB3cm90ZToNCj4gPiA+ID4gPiA+ID4g
VGhlIG5kZXYgd2FzIGFjY2Vzc2VkIG9uIHNodXRkb3duIHdpdGhvdXQgYSBjaGVjayBpZiBpdCBh
Y3R1YWxseQ0KPiA+ID4gPiA+ID4gPiBleGlzdHMuDQo+ID4gPiA+ID4gPiA+IFRoaXMgdHJpZ2dl
cmVkIHRoZSBjcmFzaCBwYXN0ZWQgYmVsb3cuIFRoaXMgcGF0Y2ggc2ltcGx5IGFkZHMgYQ0KPiA+
ID4gPiA+ID4gPiBjaGVjaw0KPiA+ID4gPiA+ID4gPiBiZWZvcmUgdXNpbmcgbmRldi4NCj4gPiA+
ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IMKgQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVm
ZXJlbmNlLCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMzAwDQo+ID4gPiA+ID4gPiA+IMKgI1BGOiBz
dXBlcnZpc29yIHJlYWQgYWNjZXNzIGluIGtlcm5lbCBtb2RlDQo+ID4gPiA+ID4gPiA+IMKgI1BG
OiBlcnJvcl9jb2RlKDB4MDAwMCkgLSBub3QtcHJlc2VudCBwYWdlDQo+ID4gPiA+ID4gPiA+IMKg
UEdEIDAgUDREIDANCj4gPiA+ID4gPiA+ID4gwqBPb3BzOiAwMDAwIFsjMV0gU01QDQo+ID4gPiA+
ID4gPiA+IMKgQ1BVOiAwIFBJRDogMSBDb21tOiBzeXN0ZW1kLXNodXRkb3cgTm90IHRhaW50ZWQg
Ni41LjAtDQo+ID4gPiA+ID4gPiA+IHJjMl9mb3JfdXBzdHJlYW1fbWluX2RlYnVnXzIwMjNfMDdf
MTdfMTVfMDUgIzENCj4gPiA+ID4gPiA+ID4gwqBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJk
IFBDIChRMzUgKyBJQ0g5LCAyMDA5KSwgQklPUyByZWwtDQo+ID4gPiA+ID4gPiA+IDEuMTMuMC0w
LQ0KPiA+ID4gPiA+ID4gPiBnZjIxYjVhNGFlYjAyLXByZWJ1aWx0LnFlbXUub3JnIDA0LzAxLzIw
MTQNCj4gPiA+ID4gPiA+ID4gwqBSSVA6IDAwMTA6bWx4NXZfc2h1dGRvd24rMHhlLzB4NTAgW21s
eDVfdmRwYV0NCj4gPiA+ID4gPiA+ID4gwqBSU1A6IDAwMTg6ZmZmZjg4ODEwMDNiZmRjMCBFRkxB
R1M6IDAwMDEwMjg2DQo+ID4gPiA+ID4gPiA+IMKgUkFYOiBmZmZmODg4MTAzYmVmYmEwIFJCWDog
ZmZmZjg4ODEwOWQyODAwOCBSQ1g6IDAwMDAwMDAwMDAwMDAwMTcNCj4gPiA+ID4gPiA+ID4gwqBS
RFg6IDAwMDAwMDAwMDAwMDAwMDEgUlNJOiAwMDAwMDAwMDAwMDAwMjEyIFJESTogZmZmZjg4ODEw
OWQyODAwMA0KPiA+ID4gPiA+ID4gPiDCoFJCUDogMDAwMDAwMDAwMDAwMDAwMCBSMDg6IDAwMDAw
MDBkM2EzYTM4ODIgUjA5OiAwMDAwMDAwMDAwMDAwMDAxDQo+ID4gPiA+ID4gPiA+IMKgUjEwOiAw
MDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDAwMCBSMTI6IGZmZmY4ODgxMDlkMjgw
MDANCj4gPiA+ID4gPiA+ID4gwqBSMTM6IGZmZmY4ODgxMDlkMjgwODAgUjE0OiAwMDAwMDAwMGZl
ZTFkZWFkIFIxNTogMDAwMDAwMDAwMDAwMDAwMA0KPiA+ID4gPiA+ID4gPiDCoEZTOsKgIDAwMDA3
ZjQ5NjllMGJlNDAoMDAwMCkgR1M6ZmZmZjg4ODUyYzgwMDAwMCgwMDAwKQ0KPiA+ID4gPiA+ID4g
PiBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQo+ID4gPiA+ID4gPiA+IMKgQ1M6wqAgMDAxMCBEUzog
MDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMNCj4gPiA+ID4gPiA+ID4gwqBDUjI6
IDAwMDAwMDAwMDAwMDAzMDAgQ1IzOiAwMDAwMDAwMTA1MWNkMDA2IENSNDogMDAwMDAwMDAwMDM3
MGViMA0KPiA+ID4gPiA+ID4gPiDCoERSMDogMDAwMDAwMDAwMDAwMDAwMCBEUjE6IDAwMDAwMDAw
MDAwMDAwMDAgRFIyOiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gPiA+ID4gPiA+IMKgRFIzOiAwMDAw
MDAwMDAwMDAwMDAwIERSNjogMDAwMDAwMDBmZmZlMGZmMCBEUjc6IDAwMDAwMDAwMDAwMDA0MDAN
Cj4gPiA+ID4gPiA+ID4gwqBDYWxsIFRyYWNlOg0KPiA+ID4gPiA+ID4gPiDCoCA8VEFTSz4NCj4g
PiA+ID4gPiA+ID4gwqAgPyBfX2RpZSsweDIwLzB4NjANCj4gPiA+ID4gPiA+ID4gwqAgPyBwYWdl
X2ZhdWx0X29vcHMrMHgxNGMvMHgzYzANCj4gPiA+ID4gPiA+ID4gwqAgPyBleGNfcGFnZV9mYXVs
dCsweDc1LzB4MTQwDQo+ID4gPiA+ID4gPiA+IMKgID8gYXNtX2V4Y19wYWdlX2ZhdWx0KzB4MjIv
MHgzMA0KPiA+ID4gPiA+ID4gPiDCoCA/IG1seDV2X3NodXRkb3duKzB4ZS8weDUwIFttbHg1X3Zk
cGFdDQo+ID4gPiA+ID4gPiA+IMKgIGRldmljZV9zaHV0ZG93bisweDEzZS8weDFlMA0KPiA+ID4g
PiA+ID4gPiDCoCBrZXJuZWxfcmVzdGFydCsweDM2LzB4OTANCj4gPiA+ID4gPiA+ID4gwqAgX19k
b19zeXNfcmVib290KzB4MTQxLzB4MjEwDQo+ID4gPiA+ID4gPiA+IMKgID8gdmZzX3dyaXRldisw
eGNkLzB4MTQwDQo+ID4gPiA+ID4gPiA+IMKgID8gaGFuZGxlX21tX2ZhdWx0KzB4MTYxLzB4MjYw
DQo+ID4gPiA+ID4gPiA+IMKgID8gZG9fd3JpdGV2KzB4NmIvMHgxMTANCj4gPiA+ID4gPiA+ID4g
wqAgZG9fc3lzY2FsbF82NCsweDNkLzB4OTANCj4gPiA+ID4gPiA+ID4gwqAgZW50cnlfU1lTQ0FM
TF82NF9hZnRlcl9od2ZyYW1lKzB4NDYvMHhiMA0KPiA+ID4gPiA+ID4gPiDCoFJJUDogMDAzMzow
eDdmNDk2OTkwZmI1Ng0KPiA+ID4gPiA+ID4gPiDCoFJTUDogMDAyYjowMDAwN2ZmZmM3YmRkZTg4
IEVGTEFHUzogMDAwMDAyMDYgT1JJR19SQVg6DQo+ID4gPiA+ID4gPiA+IDAwMDAwMDAwMDAwMDAw
YTkNCj4gPiA+ID4gPiA+ID4gwqBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwMDAwMDAw
MDAwMDAwIFJDWDogMDAwMDdmNDk2OTkwZmI1Ng0KPiA+ID4gPiA+ID4gPiDCoFJEWDogMDAwMDAw
MDAwMTIzNDU2NyBSU0k6IDAwMDAwMDAwMjgxMjE5NjkgUkRJOiBmZmZmZmZmZmZlZTFkZWFkDQo+
ID4gPiA+ID4gPiA+IMKgUkJQOiAwMDAwN2ZmZmM3YmRlMWQwIFIwODogMDAwMDAwMDAwMDAwMDAw
MCBSMDk6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA+ID4gPiA+ID4gwqBSMTA6IDAwMDAwMDAwMDAw
MDAwMDAgUjExOiAwMDAwMDAwMDAwMDAwMjA2IFIxMjogMDAwMDAwMDAwMDAwMDAwMA0KPiA+ID4g
PiA+ID4gPiDCoFIxMzogMDAwMDdmZmZjN2JkZGYxMCBSMTQ6IDAwMDAwMDAwMDAwMDAwMDAgUjE1
OiAwMDAwN2ZmZmM3YmRlMmI4DQo+ID4gPiA+ID4gPiA+IMKgIDwvVEFTSz4NCj4gPiA+ID4gPiA+
ID4gwqBDUjI6IDAwMDAwMDAwMDAwMDAzMDANCj4gPiA+ID4gPiA+ID4gwqAtLS1bIGVuZCB0cmFj
ZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IEZp
eGVzOiBiYzlhMmIzZTY4NmUgKCJ2ZHBhL21seDU6IFN1cHBvcnQgaW50ZXJydXB0IGJ5cGFzc2lu
ZyIpDQo+ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IERyYWdvcyBUYXR1bGVhIDxkdGF0dWxl
YUBudmlkaWEuY29tPg0KPiA+ID4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiA+ID4gwqBkcml2ZXJz
L3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMgfCAzICsrLQ0KPiA+ID4gPiA+ID4gPiDCoDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92
bmV0LmMNCj4gPiA+ID4gPiA+ID4gYi9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMN
Cj4gPiA+ID4gPiA+ID4gaW5kZXggOTEzOGVmMmZiMmM4Li5lMmU3ZWJkNzE3OTggMTAwNjQ0DQo+
ID4gPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvdmRwYS9tbHg1L25ldC9tbHg1X3ZuZXQuYw0KPiA+
ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL3ZkcGEvbWx4NS9uZXQvbWx4NV92bmV0LmMNCj4gPiA+
ID4gPiA+ID4gQEAgLTM1NTYsNyArMzU1Niw4IEBAIHN0YXRpYyB2b2lkIG1seDV2X3NodXRkb3du
KHN0cnVjdA0KPiA+ID4gPiA+ID4gPiBhdXhpbGlhcnlfZGV2aWNlDQo+ID4gPiA+ID4gPiA+ICph
dXhkZXYpDQo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgIG1ndGRldiA9IGF1eGlsaWFyeV9n
ZXRfZHJ2ZGF0YShhdXhkZXYpOw0KPiA+ID4gPiA+ID4gPiDCoMKgwqDCoMKgwqDCoCBuZGV2ID0g
bWd0ZGV2LT5uZGV2Ow0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gLcKgwqDCoMKgwqDC
oCBmcmVlX2lycXMobmRldik7DQo+ID4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqAgaWYgKG5kZXYp
DQo+ID4gPiA+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyZWVfaXJxcyhu
ZGV2KTsNCj4gPiA+ID4gPiA+ID4gwqB9DQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gDQo+
ID4gPiA+ID4gPiBzb21ldGhpbmcgSSBkb24ndCBnZXQ6DQo+ID4gPiA+ID4gPiBpcnFzIGFyZSBh
bGxvY2F0ZWQgaW4gbWx4NV92ZHBhX2Rldl9hZGQNCj4gPiA+ID4gPiA+IHdoeSBhcmUgdGhleSBu
b3QgZnJlZWQgaW4gbWx4NV92ZHBhX2Rldl9kZWw/DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiBU
aGF0IGlzIGEgZ29vZCBwb2ludC4gSSB3aWxsIHRyeSB0byBmaW5kIG91dC4gSSBhbHNvIGRvbid0
IGdldCB3aHkNCj4gPiA+ID4gPiBmcmVlX2lycQ0KPiA+ID4gPiA+IGlzDQo+ID4gPiA+ID4gY2Fs
bGVkIGluIHRoZSB2ZHBhIGRldiAuZnJlZSBvcCBpbnN0ZWFkIG9mIG1seDVfdmRwYV9kZXZfZGVs
LiBNYXliZSBJDQo+ID4gPiA+ID4gY2FuDQo+ID4gPiA+ID4gY2hhbmdlDQo+ID4gPiA+ID4gdGhh
dCBpbiBhIGRpZmZlcmVudCByZWZhY3RvcmluZy4NCj4gPiA+ID4gDQo+ID4gPiA+IGFzIGl0IGlz
IEkgaGF2ZSBubyBpZGVhIHdoZXRoZXIgZS5nLiBuZGV2IGNhbiBjaGFuZ2UNCj4gPiA+ID4gYmV0
d2VlbiB0aGVzZSB0d28gY2FsbCBzaXRlcy4gdGhhdCB3b3VsZCBtYWtlIHRoZSBjaGVjaw0KPiA+
ID4gPiBwb2ludGxlc3MuDQo+ID4gPiA+IA0KPiA+ID4gPiA+ID4gdGhpcyBpcyB3aGF0J3MgY3Jl
YXRpbmcgYWxsIHRoaXMgbWVzcy4NCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gTm90IHF1aXRlOiBtbHg1X3ZkcGFfZGV2X2RlbCAod2hpY2ggaXMgYSAuZGV2X2RlbCBvZiBm
b3Igc3RydWN0DQo+ID4gPiA+ID4gdmRwYV9tZ210ZGV2X29wcykgZG9lc24ndCBnZXQgY2FsbGVk
IG9uIHNodXRkb3duLiBBdCBsZWFzdCB0aGF0J3Mgd2hhdA0KPiA+ID4gPiA+IEkNCj4gPiA+ID4g
PiBzZWUuIE9yDQo+ID4gPiA+ID4gYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8NCj4gPiA+ID4gDQo+
ID4gPiA+IGFuZCB3aHkgZG8gd2UgY2FyZSB3aGV0aGVyIGlycXMgYXJlIGZyZWVkIG9uIHNodXRk
b3duPw0KPiA+ID4gPiANCj4gPiA+IEhhZCB0byBhc2sgYXJvdW5kIGEgYml0IHRvIGZpbmQgb3V0
IHRoZSBhbnN3ZXI6IHRoZXJlIGNhbiBiZSBpc3N1ZXMgd2l0aA0KPiA+ID4ga2V4ZWMNCj4gPiA+
IElSUSBhbGxvY2F0aW9uIG9uIHNvbWUgcGxhdGZvcm1zLiBJdCBpcyBkb2N1bWVudGVkIGhlcmUg
WzBdIGZvciBtbHg1X2NvcmUuDQo+ID4gPiANCj4gPiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMv
bmV0L2V0aGVybmV0L21lbGxhbm94L21seDUvY29yZS9tYWluLmMjbjIxMjkNCj4gPiA+IA0KPiA+
ID4gVGhhbmtzLA0KPiA+ID4gRHJhZ29zDQo+ID4gDQo+ID4gSXQncyBxdWl0ZSB3ZWlyZC4NCj4g
PiDCoMKgwqDCoMKgwqDCoMKgICogU29tZSBwbGF0Zm9ybXMgcmVxdWlyaW5nIGZyZWVpbmcgdGhl
IElSUSdzIGluIHRoZSBzaHV0ZG93bg0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgKiBmbG93LiBJZiB0
aGV5IGFyZW4ndCBmcmVlZCB0aGV5IGNhbid0IGJlIGFsbG9jYXRlZCBhZnRlcg0KPiA+IMKgwqDC
oMKgwqDCoMKgwqAgKiBrZXhlYy4gVGhlcmUgaXMgbm8gbmVlZCB0byBjbGVhbnVwIHRoZSBtbHg1
X2NvcmUgc29mdHdhcmUNCj4gPiDCoMKgwqDCoMKgwqDCoMKgICogY29udGV4dHMuDQo+ID4gDQo+
ID4gYnV0IG1vc3QgZHJpdmVycyBkb24ndCBoYXZlIGEgc2h1dGRvd24gY2FsbGJhY2sgaG93IGRv
IHRoZXkgd29yayB0aGVuPw0KPiA+IGRvIHlvdSBrbm93IHdoaWNoIHBsYXRmb3JtcyB0aGVzZSBh
cmU/DQo+IA0KSSBkb24ndC4geDg2XzY0IGlzIG5vdCBvbmUgb2YgdGhlbSB0aG91Z2guIEkgd2ls
bCBkbyBzb21lIG1vcmUgZGlnZ2luZyAuLi4NCg0KPiBUaGVyZSB1c2VkIHRvIGJlIGJ6cyB0aGF0
IHJlcXVpcmVzIHZpcnRpbyBkcml2ZXJzIHRvIGFkZCBhIHNodXRkb3duIHRvDQo+IGZpeCBrZXhl
YzoNCj4gDQo+IGh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MjEw
ODQwNg0KPiANCkkgZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gdGhpcy4gV2hhdCBpcyBpdCBhYm91dD8N
Cg0KVGhhbmtzLA0KRHJhZ29zDQo+IFRoYW5rcw0KPiANCj4gPiANCj4gPiBJIGRvbid0IHJlYWxs
eSBrbm93IG11Y2ggYWJvdXQgd2h5IHNodXRkb3duIGNhbGxiYWNrIGlzIGV2ZW4gbmVjZXNzYXJ5
Lg0KPiA+IEkgZ3Vlc3MgdGhpcyBpcyB0byBkZXRlY3Qgc2h1dGRvd24gYW5kIGRvIGEgZmFzdGVy
IGNsZWFudXAgdGhhbg0KPiA+IHRoZSBzbG93LCBncmFjZWZ1bCByZW1vdmFsLCBqdXN0IGNsZWFu
aW5nIGhhcmR3YXJlIHJlc291cmNlcz8NCj4gPiANCj4gPiANCj4gPiAtLQ0KPiA+IE1TVA0KPiA+
IA0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
