Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B56A6E405C
	for <lists.virtualization@lfdr.de>; Mon, 17 Apr 2023 09:08:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA05360E27;
	Mon, 17 Apr 2023 07:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA05360E27
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-solidrn-onmicrosoft-com header.b=chXEOa6G
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hpiJW0wRMZtH; Mon, 17 Apr 2023 07:08:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 92B6660F60;
	Mon, 17 Apr 2023 07:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92B6660F60
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C533EC0089;
	Mon, 17 Apr 2023 07:08:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E38EBC002A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 07:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7C9C60F5F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 07:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7C9C60F5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VculbvZs-ts
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 07:08:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E5DA60E27
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::61f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E5DA60E27
 for <virtualization@lists.linux-foundation.org>;
 Mon, 17 Apr 2023 07:08:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdpCwg8T5JOHLrmlB9WLT4xWE7SaJW0LQdlTrg97JuhUfLw10t5+h+U+BYS2bMPyqIe8UZZNFcAKwQlyurl0rQH7pg5IW3o5w7YQwwjqFqVRO+1GyCYYZaWOzqPXRbbpxNbgapJ5uZ+ijM2QDSxBmoqFJgHQmk4Y7zQae5KoFkHo5LBdtSfH/9aigFeJ+RaCpom8XkIL3psV2XysZkIaZvc1azja2d0RejwkkdHRgtaowpj9si3k/nREIEIErrXUoIxXaK/DuL+dipoULyXK74SUMp46MJLUDBRiFvJG4N/JEfLM2NHcA57YXgN6PLLPXZRQn2RVdQQJl2D+J5/maA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HP4HHPjudtDJJRDSIlVKQpQnTKqMXeceN6ctsBzDL3o=;
 b=ZmfqjRnFNK8qHqre9nXWKN8U/xmIqqZZhDU/iPXk1kfB7mHg+PU6LuylYj4zRRjM62rGf9AAfXgpVkOxtqSVtiOJVPKB/jDoXNDQK4wtbttEYoCnH+0iGx2wKfI96J/PQSIZ660azEgOE7Dj/USbHTu2kpOAvDvLvyvRf74B+xrIpOCtwwrQaOUkF2X8Z1t+X82sVWDyte9b1gbGW5LINypKRnIGgXHvrq5Mq+tE4Vp86bSB7Bb6MwdFGRfbyh4iHPoFAGvmQAzuWtKMYAV7h+Q9cO5fWSkoS8KWyVGk+5j8d8y+wr4+npgPt9lU5rzjbI39iGOdLAiO1od3uUfbYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HP4HHPjudtDJJRDSIlVKQpQnTKqMXeceN6ctsBzDL3o=;
 b=chXEOa6GqDR3eDUk7qmhrdCrcPctFPOBqcoFnd4aynr3hEhDxW93LnvHYyO3AEWDJXjogwlF93s2Ko7zZwYHLD+UM4T8xGWXvI4OfcEmVkW5t86F4CHnoEUJZ2/S6EK8qp1h3DszrFOv1j6Z1P19KR1EIDhDsSmsd5S+h8aMKXw=
Received: from AM0PR04MB4723.eurprd04.prod.outlook.com (2603:10a6:208:c0::20)
 by DB9PR04MB9308.eurprd04.prod.outlook.com (2603:10a6:10:36c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 07:08:00 +0000
Received: from AM0PR04MB4723.eurprd04.prod.outlook.com
 ([fe80::54c9:6706:9dc6:d977]) by AM0PR04MB4723.eurprd04.prod.outlook.com
 ([fe80::54c9:6706:9dc6:d977%5]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 07:08:00 +0000
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net] virtio-net: reject small vring sizes
Thread-Topic: [PATCH net] virtio-net: reject small vring sizes
Thread-Index: AQHZcDeGnH5xR2OGlkuo4s6jvhNMC68uIjT9gABGFgCAAG90AIAAMSwAgAABjzCAAAUmAIAABbXA
Date: Mon, 17 Apr 2023 07:07:59 +0000
Message-ID: <AM0PR04MB4723EB7A5E42A090F63EEC11D49C9@AM0PR04MB4723.eurprd04.prod.outlook.com>
References: <20230416074607.292616-1-alvaro.karsz@solid-run.com>
 <AM0PR04MB4723C6E99A217F51973710F5D49F9@AM0PR04MB4723.eurprd04.prod.outlook.com>
 <20230416164453-mutt-send-email-mst@kernel.org>
 <CACGkMEvFhVyWb5+ET_akPvnjUq04+ZbJC8o_GtNBWqSMGNum8A@mail.gmail.com>
 <20230417021725-mutt-send-email-mst@kernel.org>
 <AM0PR04MB4723B8489F8F9AE547393697D49C9@AM0PR04MB4723.eurprd04.prod.outlook.com>
 <1681713856.1928573-2-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1681713856.1928573-2-xuanzhuo@linux.alibaba.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB4723:EE_|DB9PR04MB9308:EE_
x-ms-office365-filtering-correlation-id: 5feb852a-e461-45c0-de7a-08db3f127a75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T6Ker1CT1WfJYmBy3ZSCJShIkWLCyM3iq7iFx20S5HDa/aYwlFbClZEavvZg+tpb6ZKjCR2+dehxffncIDhKu8zV93w8x1HBTTL5x1/RnG9ma4iw3zmXXOr36zqbJ10P9+oBaMEWsh2gHhTTWwiZ3fMxvIg0k8fBpMADf/P5f6tmKBrjxyfASgQdyTvAp2Cb2fEKcPTc5qSDYcsrOvifWz+waPaepWjFatVFiGLJdBVNJqjxFGpvD2a1dqjtA3G4hNpMPhQIrQWOB7YKllJXHU1S6HcsyF83GHA9y1cm4lZ7upSzzmIV7FTnifwV1CfYmEHY8oOP8mtuE+bblQUdxizMP5Re4NguGsrdOjsN9ncPl/OXtF65awuc1N1/8QY604wLr4Gq/+TGJ5yMA0U+NtyKH76JMJ/6B7zl1dI5AQ3w3D7EyM5UKfHT7fTlTm+ay1hYVbGeicNECWDKEA4Kr8IDzIPpJgyLQ2r03h3R9nWqjSJa4qdF1Cji1HxCSu9dAtVAP0jscqh/GWHvdd2JWFqKFBjEm2H6YJm00sQPddBUDqk2ey6n5XoGF04QAGtfejamLlR/RAlJ5NdFD5vXSRX+DrPhZxaCmiJAivRTHuqE+b7ya8IBPQeaeCpq1yaz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB4723.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(346002)(39840400004)(376002)(396003)(451199021)(86362001)(64756008)(9686003)(38070700005)(26005)(6506007)(33656002)(186003)(4744005)(2906002)(44832011)(7416002)(7696005)(52536014)(5660300002)(38100700002)(71200400001)(8936002)(66899021)(8676002)(478600001)(54906003)(122000001)(41300700001)(316002)(76116006)(66946007)(66556008)(66446008)(55016003)(66476007)(6916009)(4326008)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?MOnfyusohgK9YVDvwkyE0a//3uxaQPRu/yx4n2Ri/+8M9kuflhJqj4lBr6?=
 =?iso-8859-1?Q?UjlzBJIUHuhZ5JuWFeuIywRv4ezLan1MaUqhIBNZc3BAdZWgobhdCE+Dg2?=
 =?iso-8859-1?Q?PTnldgbSFM1ezAGRtIYS8FSbEvyR8Qr1+E9eSNIeraYtxTnaML7on45uCK?=
 =?iso-8859-1?Q?RQRAha2Zthne+vkSTmiwDUPLKFQY/PfU/2mxLYP+1Ce0B/pt+SjqKtTcdq?=
 =?iso-8859-1?Q?j/zazasyDXYPYwAIP+kFrFnSqzmamWd71NMARNguOredqarJLVbUZh356O?=
 =?iso-8859-1?Q?jDsv0I0amHVs79yyW1Y1TWJJOhMF7Hfe5DF4kFXXyzMmaI3LKB4ItoyI6m?=
 =?iso-8859-1?Q?S4pRhpbL2SI4L/blKxiAadow9VLgLGGvQzu1ZVsVPU0+NnjV/VkR4jQ1hG?=
 =?iso-8859-1?Q?RW2hU+XfTKBgzTye+HgIBwMBOtwG5JFsJUhtZBxzFuwN4tbk5w0IfXObXu?=
 =?iso-8859-1?Q?Wyg0QKwHOhX6XJVbv08JwHnOrOL7mq3vCXoiyqn1xg24l2kiczuuzLZ+fZ?=
 =?iso-8859-1?Q?aeuIAzGvcPGxky88cvtqDU6xxw1lOPATV5j30sEI6CsOY5l2qFtbMBbi3B?=
 =?iso-8859-1?Q?L/9vkqu0pvJfHbJQwOtlSZVZSsO6oNoOiLKdfee3XviRUeO1PyLz1Rv5C3?=
 =?iso-8859-1?Q?72+Y7BA9nrpyKvKHdwTnmvt5H+PmzH2YAz2hZlKOzL43ZNM5D/z7InG/rQ?=
 =?iso-8859-1?Q?kgni8wGd9MRWMyqc8mrEpne83T1Z9JYIj1c/ntDVarSL0qP2JcUXcoHESj?=
 =?iso-8859-1?Q?9hfbNnYz6kUI9tZiw2wQ7KBVMkXRDFqXtPS6WJdC90hpNhBjNDgWzefAJL?=
 =?iso-8859-1?Q?A1OMEYfSpPQ06ch3wjU141f9tRSv/ljhMNyJjk2bQiJiy2/doek4b7TIrA?=
 =?iso-8859-1?Q?+CK79i4i/ce4xCTC/jihwqAT2JkC5nakERTWZ71RpULHgvBgRin0KMDy4z?=
 =?iso-8859-1?Q?FxqtTc39muEYwDjgmV1wVHEwo2n3vw3pzVvck932KCYMKScmJHeXNCRlhN?=
 =?iso-8859-1?Q?zRTsBu3E1hzWuo/Ht3ODMIazg/QsTp1jIF99i3oGY9fkFgVmM+qRj1zwQb?=
 =?iso-8859-1?Q?dJNinAmOan7ext4oS4KWKX1M+yNlPfNRgTqIBXCq1HXpli3GMLdJ46NjxZ?=
 =?iso-8859-1?Q?6PzFJ9mp49MQhRRH01YqEbnCpnSS+s3G9VBDsbJiSSQm/8NcDxIeGqpb+f?=
 =?iso-8859-1?Q?xLuojIp5IJX+0kow0KDr/XiKRYH0hC0IUnUcnqVMCOHrJ5QUNG/dmtV/6w?=
 =?iso-8859-1?Q?8zViD5dVNMf/qzjMwT4EjOPeJoPX3lQCwD0MnjOfV/u6327fBK/8ssWfPo?=
 =?iso-8859-1?Q?Jm2WJ3ayN/hXaCrRUeTHXL4zUGEifL7d9XjVkS9ylanhnMhzErdCjr7o+8?=
 =?iso-8859-1?Q?SgLep+3+Ze1KMCGkqJIK/9ZaPPYxUI04I+dbVs+Mt8iVeUi5OjbP5aXtqw?=
 =?iso-8859-1?Q?RgHvoGxV+57PhNj8lhaYohEistUWuCjfOUgMQKk84P+kX2alNrY00GD64y?=
 =?iso-8859-1?Q?/K8vP+tfFGEpOQYTYjFs/5UZE8g9b5BNHUduQZhaRda3cO2EZVeIKOv7WL?=
 =?iso-8859-1?Q?Gjjnrupz+sCR9Qr3wNSpkuHsKf/EcXtcSu/VIdiGFh6a/RlXFjfmYTwys5?=
 =?iso-8859-1?Q?T23HfGvP6yokFZNOBhD86ytIk8mjjlgYCg?=
MIME-Version: 1.0
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4723.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5feb852a-e461-45c0-de7a-08db3f127a75
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2023 07:07:59.8992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mcNUvDCKsYD1IRz/N7Dct8Qljpe6CAa08ZGaMnlv6qxLhO8h84iCZx31+XCHzqvcKJFQOIiBDC4Z3tDnn3swq3nwHxgmH9OaubiXY1PAiI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9308
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
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

> Why tx timeout without frags?

Please see my response to Michael.

> > * Guest GSO/big MTU (without VIRTIO_NET_F_MRG_RXBUF?), we can't chain page size buffers anymore.
> 
> 
> Or, we disable the GUEST_GSO, HOST_GSO......
> 
And disable VIRTIO_NET_F_MTU, quoting the spec:
"A driver SHOULD negotiate VIRTIO_NET_F_MTU if the device offers it."

We can find a way around using buffers bigger than a page size like Michael implied.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
