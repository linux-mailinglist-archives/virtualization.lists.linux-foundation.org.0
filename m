Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F21056E44C6
	for <lists.virtualization@lfdr.de>; Mon, 17 Apr 2023 12:05:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 010434173C;
	Mon, 17 Apr 2023 10:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 010434173C
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-solidrn-onmicrosoft-com header.b=FEOkog4z
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oqWlKJ3wpMgd; Mon, 17 Apr 2023 10:05:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6AF6F416D8;
	Mon, 17 Apr 2023 10:05:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AF6F416D8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90F7AC008C;
	Mon, 17 Apr 2023 10:05:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 906FAC002A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 10:05:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5854781FA6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 10:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5854781FA6
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com
 header.i=@solidrn.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-solidrn-onmicrosoft-com header.b=FEOkog4z
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NtUigRfvXQei
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 10:05:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66A4A81FA4
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::61c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66A4A81FA4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 10:05:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCSjdau3rZ/Tm4z4JNcUzn4+TfZzYSoBOHaXsRwcxDISqCLOvitNCOI+SI17kaL0vftBEmCbZoN/0bACAXyu6DUK8KwQOCaw2O2NdCawTdAW8YMfZpeULPh2gJEq68Ir/DueOsyKbu+LyPbRGrN1Zw8u/A56jCK3XpyoMzoafZtsZevp5aUvBtWgzaFbWiN2cqKB5N7OfP4YTXIHPHylpxMshdSp12rUrdVn/QBM90/06lW9hmtSCoEd9mmASTeE4hrRejrxxvXYYzlYWiJnufWGiH5jV7s/A1ChcPTfL0SYF4uMkFbABJiFjSsjvQvezjlmviqpArIxUE5B7/Okaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TubfStyMDvZydpegKDG+I3MaSqUATRADaFMjDJNu1O4=;
 b=a0RBfiPANK3IC87J2Cc2Z/Xdb2T4I1DJC4WO5oZ4YmZc+vVH8pAv+mhNT1BfX1H7gtzyc/bkje5CoU5VtjVFURuFuSaAI14v+ExsHVo3dbMBXAI/3Vns8EXwagnJCtN732AbvlqYmhMdry0i1PVoh4DBlhXB3jDHTQVnrn+zYnR3o5rAicGG+VDb5NzuTEWakMgDSbf2+5uB1wa4QBzpl6/hjujSQ2eS/5/GfmTPdcE7D0fvu2Dvzde9rlNLKegTjs+qKAGl12nBvOcAxL4wTBs56avG9tPenoP3zWcpnim6oyO7I/2btiT84nUFymvTFGYtCEpp/Q4B0ZCkW3DJmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TubfStyMDvZydpegKDG+I3MaSqUATRADaFMjDJNu1O4=;
 b=FEOkog4zBbT08dDEhaV/7cOeIE0rxFamnhSqv1SxmJXYNJXs6Q8ZWFgY436CC5xI75uSdN0cqjfXDHCXh+0Qqy3eexxSCFR/krWCU6xekZXn3E+OgrJIOSkd5sNeAtazlZF1XynmX9FQxMat6OD9NxaNlzFDqVpUfQX7W7zHxwE=
Received: from AM0PR04MB4723.eurprd04.prod.outlook.com (2603:10a6:208:c0::20)
 by AS8PR04MB8643.eurprd04.prod.outlook.com (2603:10a6:20b:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 10:04:56 +0000
Received: from AM0PR04MB4723.eurprd04.prod.outlook.com
 ([fe80::54c9:6706:9dc6:d977]) by AM0PR04MB4723.eurprd04.prod.outlook.com
 ([fe80::54c9:6706:9dc6:d977%5]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 10:04:56 +0000
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net] virtio-net: reject small vring sizes
Thread-Topic: [PATCH net] virtio-net: reject small vring sizes
Thread-Index: AQHZcDeGnH5xR2OGlkuo4s6jvhNMC68uIjT9gABGFgCAAG90AIAAMSwAgAABjzCAAARBAIAABATIgAAENICAAAM4M4AAIQOAgAALfyE=
Date: Mon, 17 Apr 2023 10:04:56 +0000
Message-ID: <AM0PR04MB47237705695AFD873DEE4530D49C9@AM0PR04MB4723.eurprd04.prod.outlook.com>
References: <20230416074607.292616-1-alvaro.karsz@solid-run.com>
 <AM0PR04MB4723C6E99A217F51973710F5D49F9@AM0PR04MB4723.eurprd04.prod.outlook.com>
 <20230416164453-mutt-send-email-mst@kernel.org>
 <CACGkMEvFhVyWb5+ET_akPvnjUq04+ZbJC8o_GtNBWqSMGNum8A@mail.gmail.com>
 <20230417021725-mutt-send-email-mst@kernel.org>
 <AM0PR04MB4723B8489F8F9AE547393697D49C9@AM0PR04MB4723.eurprd04.prod.outlook.com>
 <20230417023911-mutt-send-email-mst@kernel.org>
 <AM0PR04MB47237BFB8BB3A3606CE6A408D49C9@AM0PR04MB4723.eurprd04.prod.outlook.com>
 <20230417030713-mutt-send-email-mst@kernel.org>
 <AM0PR04MB4723F3E6AE381AEC36D1AEFED49C9@AM0PR04MB4723.eurprd04.prod.outlook.com>
 <20230417051816-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230417051816-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB4723:EE_|AS8PR04MB8643:EE_
x-ms-office365-filtering-correlation-id: cda1b5ce-1fd9-4124-a0b9-08db3f2b3256
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5EG0GCUkg4QiXJ9LgFVFrdxJMYUirt9eETrk8zFrDgE+N96Z8NmMOrIuh2AlrwycFon3+qQpisXW5bBFmR89X7672iq0mOHsGuGa1+dY0VRhwL5uhR87yN7kHesM91ZV5ZFSEppislLqbHGigg2hx6J1OB0CzlGj8Rbzjsq5miggbPbafuoXjg0WTS3IrswT6ziRMJ6jZ/A5Oh9sPVXC6ruIXCudrSEEV9Xs2+lLTee5biyDD+/atA5uKbCa7YyW8RYcGVeh92gArSKHkwB54VIaOBdgMAcsQDn1Cafssus/tJ0kvj7z5D6a3qjM5iwIA3kP6PgKN/3fTZXqI+jfFVawHFRmhkdvL+8x0AiBtcmzHA+haPkR5+/WkfGbMiI/ukv8upHepDYv8C2ION1mX1x5kbKRDAwgsdyHFFR/Ds/Hu+jMNxJdM8Kvj1TUyjuK9E3/6y/xejMZdm6E2XsUIHEvMKyWFILjcwMLTVb/T1zcFfeneOZve9DhJ6L/kmeU00DQkHC6yay+ySuPOnyp/cui8rHsJBkOeNqYUD6ydPAL3GAei/OoEjj2xw7eIVEhzNB5b3dzOXEhgJenrr4ZWR2GbIlM3dBF5O6u3FyDmMN4UDTheP4Z6eAlu1Koa2jF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB4723.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39840400004)(396003)(136003)(366004)(346002)(451199021)(7696005)(86362001)(478600001)(55016003)(71200400001)(26005)(33656002)(6506007)(186003)(9686003)(38100700002)(38070700005)(122000001)(64756008)(6916009)(76116006)(66446008)(66946007)(66476007)(66556008)(4744005)(316002)(2906002)(4326008)(91956017)(8936002)(8676002)(5660300002)(44832011)(52536014)(41300700001)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ovffLJ0PBKInikWWWfD/Ye4bE2JFpQ3fuDcrEosa3VbHVbvH8yrSaWURgw?=
 =?iso-8859-1?Q?t8ewG2VbiVO1p67VETwKoM5dZiTKWZe8aJMrI+uUUiM3BXjFG/VoLAReiX?=
 =?iso-8859-1?Q?mYTxLAUESOdybMd9ddo8KC3PSVkZOW5L782zcpHCw1XFWiUa1qrJ1Iqh/z?=
 =?iso-8859-1?Q?EuAqDjkdQBAbNYEnYrB4xtCss2e5Z5cMGyBlw+QfsPdfT4UZqIQiQ/Zind?=
 =?iso-8859-1?Q?R45r7VCWKZNkoAKumCMxD3bAHGvErc+DFpMFapcduY7NdP4E25YZqntXua?=
 =?iso-8859-1?Q?QKXezE48by+5LXr3SaPx+vWdjjJxURa1Tx0VzbmRrMTxAswLYG1ocQz60x?=
 =?iso-8859-1?Q?3f3Gm8N0vca6+SnJuqOYB4Mqyg6f8cG4dmBTtmeWAUzuq0ReUAmD+wAoTl?=
 =?iso-8859-1?Q?4kC0KNYtRl3EvoM1nEoVLpEjeiuZgh0YBXE5tSJJi5/GFv+3hR7pNrSRIn?=
 =?iso-8859-1?Q?SMgnyAAd0bycm1GNpQ2IfkD/HNrVmH4jsLpMpVoc6F3XRkzp8L7kcHjqAE?=
 =?iso-8859-1?Q?95oWo9IBWgSitKBIU1Z4NY10CgPhq2c+JVseWHrQ7sRSWWH3FbKsmx6Lrc?=
 =?iso-8859-1?Q?U8FpF8MYUtV40qly2OmzI59Lk6YLoBRattCSazq7AEV9+g+85wklRREh88?=
 =?iso-8859-1?Q?eiE9mBg4Kj6M5ccc3x52i6aQflRISxcj2dYfGewByX6E4GyY29zGeXLgbp?=
 =?iso-8859-1?Q?M0QJoaCwUZieEAkC6kzjmMxWHSA3LWkmZaYvsJ2mORD8AGs8CNVg6Ay0Yq?=
 =?iso-8859-1?Q?i3GVmCo7aLCn5OYyNm83rAnAc3kpIWmN4H11j9igMgIc+lCOmrEmWfyLzx?=
 =?iso-8859-1?Q?6ZgJ5UEBme7yIGL5T3UST78Hj9gDwzT6j2Hd+TJoUHAHx+TqckcyI427KY?=
 =?iso-8859-1?Q?UPf9HuvYneryZmjf2J5XBE9VAYe7m+vIv8wzUperRqBDhuu46yucPEzt6I?=
 =?iso-8859-1?Q?Qes6lHetgiLgS3HTVmppXaBFCozUHSKK/CPe5jPX6odq8EVj1pReqGanv0?=
 =?iso-8859-1?Q?Q8I7Lr3w8ZBu7DSoJZRJEjoZPsXgKoDpQYv0v1Jsz/21YolP7sEgmRALR1?=
 =?iso-8859-1?Q?7+VgvOLYJfXWPhJn7/UOFYPQ0It6fI2aslXOGPIsniMh3O5QNKwXUBpJs3?=
 =?iso-8859-1?Q?aQpQWVzptO8m0tCxRwLapkwen8C3+r5+41Z3lMPWanf7Xo+f6Hvegprqxb?=
 =?iso-8859-1?Q?/L9WjkLo+6CoiB88Hmy7aWvithXD/5fWGQHdR/LNozMNbWn6DXCjH367W7?=
 =?iso-8859-1?Q?laGsHKBYuNwU/T3pscCQwwCNrzecvtLxjkhX6UGXGGj1NqTWUwmEkqMU0u?=
 =?iso-8859-1?Q?xeXd9dPtdX9YpElYQmGu5WmjCUBusGSmW3YwOjHPaEEHM/kmn+0XR+f9Ra?=
 =?iso-8859-1?Q?/guOISX+0pXjxJfSxPGj+K0Xn1RF9RCwvH16F4VrM3jmUl+kiNgnJoIZ75?=
 =?iso-8859-1?Q?8+z4g74L4lXY+E4+jUpLYHroydy0Tm58YQIpHDrVLTZdkBdRlW2tzHj/wj?=
 =?iso-8859-1?Q?1rIiBd1Qxa40o9axljh680KynhVwlu0moHFEVC1AU82UUs6Xnjq+ZXJzV/?=
 =?iso-8859-1?Q?XROn8J24DhMGxowuctdd4/ahHmFAIBIfghYWGLzpVeEDoe02I6SvfgQb+e?=
 =?iso-8859-1?Q?tcuU6rIIc/KxmUeKARy0ZxsuWPx2Jp7DFX?=
MIME-Version: 1.0
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4723.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda1b5ce-1fd9-4124-a0b9-08db3f2b3256
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 10:04:56.3405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q0IvrCFA+EWZTor/c3Mfg/1TlJk5ORIqcRVZuqOqs8/d9Xg5867HvajhUjYJ47/k2QmdERaTuJ9MFmT0m0iuxOBU9ucrhmhhKDKWjFsOuAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8643
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

> > So, what do you think, we should fix virtio-net to work with smaller rings? we should fail probe?
> >
> > I think that since this never came up until now, there is no big demand to such small rings.
> 
> The worry is that once we start failing probe there's just a tiny chance
> hosts begin to rely on us failing probe then we won't be able to fix it.
> So it depends on the size of the patch I think. So far it seems small enough
> that wasting code on failing probe isn't worth it.
> 

I see your point.
Regardless, we'll need to fail probe in some cases.
ring size of 1 for example (if I'm not mistaken)
control vq even needs a bigger ring.

Maybe we can fix virtnet to allow smaller rings + fail probe in some cases, all in the same patch/patchset.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
