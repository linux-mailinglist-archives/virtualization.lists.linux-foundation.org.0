Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 566356EBD81
	for <lists.virtualization@lfdr.de>; Sun, 23 Apr 2023 08:51:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7CE940605;
	Sun, 23 Apr 2023 06:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7CE940605
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-solidrn-onmicrosoft-com header.b=ZMZ79J1O
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Se3_6841V_oW; Sun, 23 Apr 2023 06:51:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 63310405F3;
	Sun, 23 Apr 2023 06:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63310405F3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1A54C008A;
	Sun, 23 Apr 2023 06:51:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C001C002A
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 06:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3735541A06
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 06:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3735541A06
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com
 header.i=@solidrn.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-solidrn-onmicrosoft-com header.b=ZMZ79J1O
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id buNoWgldCagl
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 06:51:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 203714193A
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1a::601])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 203714193A
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 06:51:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbPAg0FTefJZcXctLfTCtBhkZewqdNIOXWRhro7L2U5f1sc9B2un+7/dGh9wwSoLd4UuXICqgFenar/mRnXAmD1SBHjlvKRyzXYCOfh2ZfOrha0uigw/IYMUb+oAEbchbhBQIbC5uTRjOXUj8TOylfTzH6gDhyZQYo4YQMGiYAx/cY+k51vSNXyYU0iPhPVIAeGNymfpRaA20vR9BCmwsrGYzHkWMaL6HmMsHaZ609Zf9jMqZDsv2fjoq4oIbjsGfRfiq0X0yIvMv9tjEuHXEoj36Jrh+9WVn9Nul682NUZxyyIPbbwVlWA3nFzkLuKo4nwCHO7eff6BtjW49DroKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+wERt90tGGt70+vodvGZVyBjlXg5w4QdYK7wQIGahc=;
 b=Fn6fW63JbOhzCQhb/J+NshLFNJbwO9ha4KgHfOn/Qn1ljG+GaDO56wqWg7eYwgJg0mD4+pAQK5F2UCf/yqaOyNSJSgyjnv0Ylzo2RjbM6C4cx6ej9ULdTTkb/FikUGBgqR64n9WFRU/dlMrVBJAM1rJbtAkoOnUg9Q3dEiix7i+0HGBjKnJMYdsIH4E2HGmnZdJk2A2YYt2+RzrGUh28ffCk4QhdCz71Lie0juH5jiSXeZ0uHoHhBsDRqm88FZ6PjpyB+hn6QLoCnANKqGG+1yD5D//ARC7EWbmCf9Px2ZrDWqus0NmEZ4ThAgtAq/SS7QW9aAbsXOjOe9maYQgmaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+wERt90tGGt70+vodvGZVyBjlXg5w4QdYK7wQIGahc=;
 b=ZMZ79J1OgEDN5M67Vc/TocLB/cvgo3Vq09aONBYauTvgdYbVGBuY3rKMuLP+gT7Fq9I5QIgM5Knuz4SxwutxYc0WsIJn2JWnn6i3g9gQZv5nYjZcZmcAnf1sTXT5xciBMd+Kl5AOoLHjcOdjkTz+Su288eT7KA5cD/jpwUj7dpo=
Received: from AM0PR04MB4723.eurprd04.prod.outlook.com (2603:10a6:208:c0::20)
 by DBAPR04MB7478.eurprd04.prod.outlook.com (2603:10a6:10:1b3::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Sun, 23 Apr
 2023 06:51:47 +0000
Received: from AM0PR04MB4723.eurprd04.prod.outlook.com
 ([fe80::d2fd:ad65:a6e0:a30a]) by AM0PR04MB4723.eurprd04.prod.outlook.com
 ([fe80::d2fd:ad65:a6e0:a30a%5]) with mapi id 15.20.6319.032; Sun, 23 Apr 2023
 06:51:46 +0000
From: Alvaro Karsz <alvaro.karsz@solid-run.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net] virtio-net: reject small vring sizes
Thread-Topic: [PATCH net] virtio-net: reject small vring sizes
Thread-Index: AQHZcDeGnH5xR2OGlkuo4s6jvhNMC68uIjT9gABGFgCAAG90AIAAMSwAgAABjzCAAARBAIAABATIgAAENICAAAM4M4AAIQOAgAALfyGAABuqgIAAAQKHgAADxACACRVQMQ==
Date: Sun, 23 Apr 2023 06:51:46 +0000
Message-ID: <AM0PR04MB4723FA90465186B5A8A5C001D4669@AM0PR04MB4723.eurprd04.prod.outlook.com>
References: <20230417021725-mutt-send-email-mst@kernel.org>
 <AM0PR04MB4723B8489F8F9AE547393697D49C9@AM0PR04MB4723.eurprd04.prod.outlook.com>
 <20230417023911-mutt-send-email-mst@kernel.org>
 <AM0PR04MB47237BFB8BB3A3606CE6A408D49C9@AM0PR04MB4723.eurprd04.prod.outlook.com>
 <20230417030713-mutt-send-email-mst@kernel.org>
 <AM0PR04MB4723F3E6AE381AEC36D1AEFED49C9@AM0PR04MB4723.eurprd04.prod.outlook.com>
 <20230417051816-mutt-send-email-mst@kernel.org>
 <AM0PR04MB47237705695AFD873DEE4530D49C9@AM0PR04MB4723.eurprd04.prod.outlook.com>
 <20230417073830-mutt-send-email-mst@kernel.org>
 <AM0PR04MB4723FA4F0FFEBD25903E3344D49C9@AM0PR04MB4723.eurprd04.prod.outlook.com>
 <20230417075645-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230417075645-mutt-send-email-mst@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB4723:EE_|DBAPR04MB7478:EE_
x-ms-office365-filtering-correlation-id: 0fa4e480-dcb2-4e8c-a29c-08db43c734ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9qdBlwzqWkjcja/5VzJC7TKga78WcNuwmtHEfPXv5znrhYyoN6IQYiy9TNh3jfMJ243bTrecldlt1lQVuY2WfwVcbJkmoar0XxzEubE5XWtw4JgvcFyuAQ+GW1C/0yiCzCfyLyNG+nZXRiK4LAu22H8sTghHIhE6TuNUaChYM3DM53pNnWP/IdJ2fERzq9q8F4XwD1TdlyG7zS81+yjIvKYZ61PwpR3v/otXGeR/OpvlHBnjJF9yulBnOM204O69iXE7W3EmTtlak1Kv3xKJ2xPPwvDXwm6aDQkDtN0+7168tHcQFKW8cNJVxZuwGLQ42FpH362cy4Nk5ENQRlO0U6A5mHGzua/7CEpLMZ6xdsc40sOX6fYpSO6cjC/0ELeTnMEILQ4cGmKYN+7mAJlOLtUkFB/X8g/EMwJxxuw+2gQes20c+3o8A+epJPGdvOIOsLaG/Mq1ZQPst/5Gh2h2bJdh/fYeYlvJOjbKglzEIP94xzNZU2hNtLa6VpRjEKdx8d5L+xp6AD2ro4U+1leHTnKKmlhcVaOH6ZoaLJREPuV/OGAHDPR97kpn4KmrTvMI78pR9lTeF1yyzsdhKT0MLzIFQg8Q/TmBpWcXJ3KdutIsxKIq482T/HQ3KVw85P5G
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR04MB4723.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(39830400003)(396003)(366004)(136003)(346002)(451199021)(44832011)(5660300002)(52536014)(54906003)(478600001)(8936002)(8676002)(86362001)(38100700002)(122000001)(4744005)(2906002)(316002)(33656002)(71200400001)(7696005)(91956017)(76116006)(66946007)(6916009)(66899021)(64756008)(66446008)(41300700001)(4326008)(66556008)(66476007)(38070700005)(6506007)(9686003)(26005)(186003)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1L33NH+dnfjmD9qogRRIQBcqBSWIxaIAKKg7YK9o+gMgkPaLdtTlLZ2BK8?=
 =?iso-8859-1?Q?b/0zKiBdwpbMOjgnvFOBGBZfKurAdp6ScrIztD0jh+toOhlkpYz8w79vgy?=
 =?iso-8859-1?Q?Fjn9lxpD2TareYkNbkiV7Cjf2lmwVgxUHeJOVm3srKX6ZcZGggjWlb568J?=
 =?iso-8859-1?Q?lxS/p1RXlSMhhai99HTxuMqbDku2KjiPwnjf1aUvRcqdY031XuXfO/TAVJ?=
 =?iso-8859-1?Q?lJ1WtsAd9ioc/MahBm+ZfX5k8ZeFCiw4IuePeH6f8xRrTwWHFmANy6lXAr?=
 =?iso-8859-1?Q?R3WFh+ZiEzk0RiUex+FVinoyfxCmolK1MccRoslsIMKt/Co0yqjUROfKWh?=
 =?iso-8859-1?Q?cu6y2y4CVCDGek7JHhOmueN3l2ts1RwXP/z//d/AmOnzF7Elv0asoQVn5X?=
 =?iso-8859-1?Q?UY1RTVg9+fB+u5djcV3Mm3Bz45lmOYHa8tn/w2F2+oGsICu9XKpPtmKiRE?=
 =?iso-8859-1?Q?izHHHUTDKxi21YANaJyGUCOhZPokzJ7Suu2CQsc09TR+A0H70dHGtHdtMi?=
 =?iso-8859-1?Q?x8d4ASOELcH9troe6yzMUT4eiCzN+ywclSOJ+sC3LmpyV3GXfR2Ap+kEJq?=
 =?iso-8859-1?Q?pktgEtjnQiLjHam3D6GV/os+ivqLO6Qn0mMn6K+IF0jlyaRksFBn3+J0ql?=
 =?iso-8859-1?Q?MbcqvutYpkHVEUdgUZCRqEehK646PCZ7i1dTeQbP+3utdExBPnEOPwXIBC?=
 =?iso-8859-1?Q?kAh7CoO6T04j8YCAbvIi0E8cHhbiFlhGLQLgPdL/DhbhRSeC4kv0g2VIMJ?=
 =?iso-8859-1?Q?mTd+eEx4Fup1JDvPxc7xyqYaepxQwcFqjB6z0xXXU6e4xWaHES8JQWVcLE?=
 =?iso-8859-1?Q?CCtcGQlv4taFpKJ+I/tasui05QSPCEA3WB27zvnPeVKnXj8vpjcvzcj5fU?=
 =?iso-8859-1?Q?QCNc+pHc7wxKz/6hObOmRSPYh5SMEOC8VXK/OV9pSWH0qzEibea3tpCN3V?=
 =?iso-8859-1?Q?smrqssTgyxG5Coqx8RwFJbj82WPccgM+c9NUb1cuTDwVyn17g6dxn8PkHf?=
 =?iso-8859-1?Q?uUCg5+nZLehXyZf2fjkOXVnOfnXK9H5I47q8nmv2TmgqJWjz2yMmzguooi?=
 =?iso-8859-1?Q?oiADTEmjh2yvDUZukqxcg1v1BfInTiuIrEtAYq2dP48HYd8qTjpbpfpGOk?=
 =?iso-8859-1?Q?isiEnN4eBRjj8XuSXySpbs4u+y3Dau2D9xZrcckGg2pXRCEp8bTR3up35o?=
 =?iso-8859-1?Q?A6VR67IQq1ZKwBGYTbavY8XWN+5fYTuMyz5PhZtd6h5sRybicxkMyg+5yw?=
 =?iso-8859-1?Q?HLVtrEykp9zeMnhLDGy3aQhd62G1GZ3d0tzk/7/ntePpq9tv0jIB+ZFZeL?=
 =?iso-8859-1?Q?apoN8IPdII220b8sa0JAMh913fvgPYGVSbkCkVBpPFk6upHRj9G7WQIonv?=
 =?iso-8859-1?Q?sJHY7ZLB+kdCKWwHyHSin3k/ldoY0x3i0rgyLwnkXL++o4uaOIXmdLmAgy?=
 =?iso-8859-1?Q?QnkzjO0ywB7gjXW17SCo+O5Gu8aBjdfkqZodXYeh/VDE+Qpkq+rB2p3qig?=
 =?iso-8859-1?Q?3orYsILBLGOPaBjRquAx9c8R/VFvgR/hqUpo+4kfuTUsnvdNvNdPhKVNCC?=
 =?iso-8859-1?Q?8mPCvYd675IvjcwdyTlhD1QjN3V3mTdrab1DDfKB3MWehYDaCtDs7yBHeH?=
 =?iso-8859-1?Q?yU9uqlnL30tYCtW7glkRtAegPbuv0/wfKw?=
MIME-Version: 1.0
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB4723.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa4e480-dcb2-4e8c-a29c-08db43c734ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2023 06:51:46.8639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fxxpQtamv58ZFaCro979WDPf3KbZ0olQBO78Zvh/IgpO4QHCSmUQ3ojJe9lChjNIJsxEuHSfmCRfecqLdP4hwXoextjgKiCVZxQR7S68SZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7478
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

> Yes that makes sense, it's architetural. We can disable ctrl vq though.

The problem here is that we know the vring size after calling virtnet_find_vqs, so the number of VQs already includes the control VQ.

Actually, many variables/settings that are initialized before we call virtnet_find_vqs may need modifications if we use small vrings.
For example has_rss_hash_report, has_rss, hdr_len etc..

We could have a fixup function to fix everything after we discover that we are using small vrings, but, honestly, I think that this will be hard to maintain in the future, and I don't like this approach much.

The ideal thing will be to discover if we use small vrings in probe's beginning.

I'm looking for a way at the moment.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
