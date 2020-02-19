Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6241644AF
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 13:53:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CD1DF85E7C;
	Wed, 19 Feb 2020 12:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fAt1YYyJXgni; Wed, 19 Feb 2020 12:53:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 52C3F85E9B;
	Wed, 19 Feb 2020 12:53:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30CD0C013E;
	Wed, 19 Feb 2020 12:53:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 304A0C013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 12:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1DBFC85E95
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 12:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQhmIqDXAh19
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 12:53:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2079.outbound.protection.outlook.com [40.107.20.79])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8E06385E7C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 12:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmGaVcqtJiTVZc16QLRT7uHm3ZaoDnVc4RJ8USXfeJxDY3ffxS6F1sxBdOEq0ybYM0NUpgvioHtoHTUNQf3pWp41o8RciMizwjpyZ2Kng7D1HGN6bhtvUcz0slYYoqXwgnwHhlsmvksYMsVVxqHQK81RuHuDKhei3SVezOCyX8xWWwWcCGPNtzdB8uhfOZ4phSqxZKrX7zHuTABl9/PYuSR8awvp/JdgSoI82YvBIBxVhALGMAloJQPKJ1QdIUXoOM6QQ9J5xZCfYHk2PAgw4hFK++jwHqUGFW9xFE64Gj8B4zPEmljwoX1WS80Dk/qr9wV09uV6bnne6XuqJBDskQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4U1S7gWxCLD+xZLK4Y4HwOFiPmx8BRGT7v9BHSVFWxE=;
 b=eHsK1uZzCNqyS0KQQ5oRQhgMfan8L4mTfTDtUOmAzo0jDyJLEIEHNZv4/K7T437Zq4NKg+7hXoy17Fv/hDzB5zQNd38KYmAHzBhRuo+k7kFrywpqFrSi0K5kJdzImBnRR5zuwojmujp9pUemkflYDPWNWCNhv9Wc7gNoff5Ky17zxjq0CPPZOtltJAzYsKh9+unhs1J3L4JdCfStPzrx6vMzGKJ+5aJl/BEnGzOk6eDr/3+lCG3h7kAglG8AwzYBtsmcF0/wxbgQn2Rl260nZCHiIfJIptwH8aZPn/e9sKEV1U7JaHaGWkGSwMYnMGoxgeKBKvtsz4UtynA2jW8Kww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4U1S7gWxCLD+xZLK4Y4HwOFiPmx8BRGT7v9BHSVFWxE=;
 b=IPGYsba6GSc122cZ1aYJwnV8l1LQCjUXumQ+HqsJIa9DSZNbpkKiG0PJyP1Ob+foH68yQmjrfp9urhPhX1FJqceQ3vdS5w0aAATc9EaYggBKnM68w30oMcfR9LRQN7SVGSI3l1qQzLSBZxP8aj3mQPTF0a+6Rn5dmXPHqUL0C0U=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5389.eurprd05.prod.outlook.com (20.177.201.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.24; Wed, 19 Feb 2020 12:53:02 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 12:53:02 +0000
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR14CA0025.namprd14.prod.outlook.com (2603:10b6:208:23e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.18 via Frontend
 Transport; Wed, 19 Feb 2020 12:53:02 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1j4OqZ-0000XF-5J; Wed, 19 Feb 2020 08:52:59 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
Thread-Topic: [PATCH V2 3/5] vDPA: introduce vDPA bus
Thread-Index: AQHV38asJrupyM4st0u+LnLMVE2dj6gWBCEAgAEv6YCAAFKZAIAA9rcAgACprgCAABWWAIAAAfIAgADOIICAAK/EAIAENTiAgAIVHQCAAQZvgIAAekGA
Date: Wed, 19 Feb 2020 12:53:02 +0000
Message-ID: <20200219125259.GH23930@mellanox.com>
References: <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
 <20200213150542.GW4271@mellanox.com>
 <8b3e6a9c-8bfd-fb3c-12a8-2d6a3879f1ae@redhat.com>
 <20200214135232.GB4271@mellanox.com>
 <01c86ebb-cf4b-691f-e682-2d6f93ddbcf7@redhat.com>
 <20200218135608.GS4271@mellanox.com>
 <bbfc608b-2bfa-e4c7-c2b9-dbcfe63518cb@redhat.com>
In-Reply-To: <bbfc608b-2bfa-e4c7-c2b9-dbcfe63518cb@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR14CA0025.namprd14.prod.outlook.com
 (2603:10b6:208:23e::30) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.68.57.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ba3fbb23-66d0-496c-1b57-08d7b53aa7ab
x-ms-traffictypediagnostic: VI1PR05MB5389:|VI1PR05MB5389:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB53894C300B08E0D37A71AFC9CF100@VI1PR05MB5389.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(189003)(199004)(52116002)(4326008)(6666004)(1076003)(86362001)(2616005)(478600001)(2906002)(33656002)(8936002)(7416002)(71200400001)(26005)(66946007)(54906003)(186003)(316002)(4744005)(36756003)(66446008)(64756008)(66556008)(81156014)(6916009)(9786002)(81166006)(9746002)(66476007)(5660300002)(8676002)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5389;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h2bn7lMnv5+3VAWg8h1VzAxvHo8s5grx723CDDzXVV07RrFEUmpPXMX8XIDGYjx3bJQkMmI6KqThTikiXUZi4NwMXLHy64RckQ+ZG44hSYXmaD0YHvgkEQ+WUVjSAwng1au1CPb5yFiWTzsyh4TBvMgo+mjdV0GMl7ohVGuSSS2JBFzMgkEE7iXVrT40UnUjxOA3lGELZMNJLyxJL+7uO4dihJdeH8m2zxEYr4QVkJskpFntnSDFi421z83nMNCywK3OlqmKUrDOruCn2+TQC0kJhzIIFDBdGyAcq9eMGfP/tG3yPDA+4YB305BGKyS0ND/eoip46cTYegD3FES7VgiXJL/5dCktwJ6mE30c27YFCJZWxiwyJRfMevXNS2Ui81mE/cLSgYv6LOHft53QKBAzxmBVsupR8Dsu1EwF1FX35PASd5wDDhI4jH3AHWghuT4hhvI2/8awJ/9Dnn2wZ4dxW6VNvqx8QvDvGW/6VClGApPzaaLi8jYVswiUMxez
x-ms-exchange-antispam-messagedata: 3KmHXdOKXt3p+R/SpTcbfIFAAbPJn8i/qeEwpMJ5bE9BEk5SxHkLkL2BUlChz8ALFSms17lF55JV3cpOFqD35h9Exnj0DOv7jlAYlT8JFA3FR42gW+ZE0bcPA94c5qsvy1E2ZWbjSboxus4RH/q96w==
Content-ID: <9CD8241DD584C146AFED1EACF6700144@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba3fbb23-66d0-496c-1b57-08d7b53aa7ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 12:53:02.5591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T2Gm6sTxtBrUs+PoINIJ75nsuTN77W160XncxFqtXOCGiQg1y/3XrxOV4JFVAwhUWI3M1EB1GsNeRqAGOJmSDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5389
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
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

On Wed, Feb 19, 2020 at 01:35:25PM +0800, Jason Wang wrote:
> > But it is
> > open coded and duplicated because .. vdpa?
> 
> 
> I'm not sure I get here, vhost module is reused for vhost-vdpa and all
> current vhost device (e.g net) uses their own char device.

I mean there shouldn't be two fops implementing the same uAPI

Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
