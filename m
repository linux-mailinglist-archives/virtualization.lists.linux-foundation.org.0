Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 865977D859C
	for <lists.virtualization@lfdr.de>; Thu, 26 Oct 2023 17:09:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AF4C417D9;
	Thu, 26 Oct 2023 15:09:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AF4C417D9
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l8msZ4h9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r8ZE-A4TuuiL; Thu, 26 Oct 2023 15:09:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3F1D741A39;
	Thu, 26 Oct 2023 15:09:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F1D741A39
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83ED9C008C;
	Thu, 26 Oct 2023 15:09:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2563C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Oct 2023 15:09:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A69A46150A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Oct 2023 15:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A69A46150A
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=l8msZ4h9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ehkmOuoQO4pG
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Oct 2023 15:09:17 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::607])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D90FC614A0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 26 Oct 2023 15:09:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D90FC614A0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyPZuU9hvihNkrpxTv7nh+8SeLmCrGziUyFo+2tlxiwh58rAYoLKpWdzvU4r7n0qOiAYImaFl9cvrN5nVW1XK7XYrXlKFEC8pf2Ct8wDSQgnbM8mZOeKXjXIgTxR3+yYeMJhhsz15bVZ2h258gRhL+GDTovZG3elpYMVMM7MEW63KqWWJl9t5izxUw0ZvFDsk0qEtKKcQ2wm8dfV2oH2gZ2GalRYyXdtpdqnDPWqkJs/DmZxoHPEk+6QakERfprCR6Lwm59GdmnOIaYuupTNs69szINWtNcUSgslTYOVDKDYX2XtvGs1Huvp1KSklF4yDmgwqI8v6umwpjM7GW3G/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSZAVw54jwH120hHNwiBTEk53Dow2nkt1YntgA5fsqQ=;
 b=NbYTMIil3CAQ+bPHbB+hG/34gIYFFzm+2gKv2N4KYgVaaKqftf+jUVV0W3m1vhxLx+SF5kJKvOfh3CK8O2ec7dgYvhynVm5aezkO2eSboBy0/xN8BlH3XBM8moo4wnyDzu4rfwdELZrNmVt/TJjxB5UkDNtUY/t1x36Us9pfvSum1oDVnNlUi/+HTLVJQnS2Obw1dOmr7dWQO9aTdmD48N7OVJGGBg4xs/8OFiVYmQXr6J+dfj/uNOgvtplco0Ii/ixxuE2vis8l5EM2zEW9J9v22fYjWShWjUzUDBpBPcURydYgvFodxpFX82LlaYMpkRRp7EGB4XHU36xwzbsDzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BSZAVw54jwH120hHNwiBTEk53Dow2nkt1YntgA5fsqQ=;
 b=l8msZ4h9KGXMsXPC76XPU+ybWzZr6vCGPikgex7uQZLLM9+nBFq27KlUAEAZpk9lMImrW/cp7JEV5nfchJmhZLB84rVza9Dd59nx2eFKtNnwx8QvM9VDcPdvt7Iu4N6Gkxr9ixF+0oksSe2n2JtCopBSjc2fWFT+ZItg9192fme4yyqiWMTzzsa9DqTdryOYX3tDczyhgkNdZAIwPKZ8afAjMEtOPAyEzhMXxqjhyIVdURDB/oTk9Yf65yfGbCr/no8rKDwZF3X/NweKGdVALQaaMsvdEODL9xLxL2OifKPiUjTtQHO9Y+QfbnCK9JST4wz87YxC0qsgF5ZZMSqHOA==
Received: from PH0PR12MB5481.namprd12.prod.outlook.com (2603:10b6:510:d4::15)
 by SA1PR12MB7038.namprd12.prod.outlook.com (2603:10b6:806:24d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 15:09:14 +0000
Received: from PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::cdcb:e909:74a4:be7c]) by PH0PR12MB5481.namprd12.prod.outlook.com
 ([fe80::cdcb:e909:74a4:be7c%4]) with mapi id 15.20.6933.022; Thu, 26 Oct 2023
 15:09:13 +0000
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [PATCH V1 vfio 9/9] vfio/virtio: Introduce a vfio driver over
 virtio devices
Thread-Topic: [PATCH V1 vfio 9/9] vfio/virtio: Introduce a vfio driver over
 virtio devices
Thread-Index: AQHaAP/t3dG05nYg50S7FQsh4+CEA7BZZo+AgAE4i4CAAE2RAIABG4MAgAABLoCAAAcq0IAACmMAgAACvMCAABw+AIAAADOA
Date: Thu, 26 Oct 2023 15:09:13 +0000
Message-ID: <PH0PR12MB54819C408A120436010F608FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231017134217.82497-1-yishaih@nvidia.com>
 <20231017134217.82497-10-yishaih@nvidia.com>
 <20231024135713.360c2980.alex.williamson@redhat.com>
 <d6c720a0-1575-45b7-b96d-03a916310699@nvidia.com>
 <20231025131328.407a60a3.alex.williamson@redhat.com>
 <a55540a1-b61c-417b-97a5-567cfc660ce6@nvidia.com>
 <20231026081033-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E1AF869C1296B987A34BDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026091459-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548167D2A92F3D10E4F02E93DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026110426-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231026110426-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SA1PR12MB7038:EE_
x-ms-office365-filtering-correlation-id: 2364c5db-3c5d-49c5-9fc1-08dbd6358401
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kjVe56jtcd4+xjDZslPy7f9NSXkzPQ79Iba+LiFnTHBD0TzSPXkwk+0xRmlfo+UcBAMaYgrYqes0TUvg3I+l/Z0uNO+7HQXIS9phY9KMWhjP+xz1/pXAXWu/GfLmoHzMUbTFpuSX24/Y/ugArA7V9k5X1u3hXJxKxk7j7VMm9kktMLeakzBp4st0UDe1imycA5qnNrXWnfEhMp4qsyN2Z5IPbESeoFtNFayxczTN4FqkjhyE+l9aH7a9ltBRx5etsLlt2f9Kna+US8wnHY7PxzmFnZNeaURb/mQx1ByRHKeNj2/tbDf1iHhzwPkMJpdxGB2jFaZgdgNHGO+7UngJBxbgB8pk0piKuAsPyd1OCMLuNj5XrzrrQn1C4aMYB5LUg+jnmC3wJSyCgVGJ3GcWN9Dx/MvUb2uU0n/jfnW5o9LJpyFe7kze9qfAfg8SQF39Ueefu4mlWOCGOF2P3EN+T5ylA1V/CUziI+Gtc5X0t0oDHFeri2MDvPaDP2isqFpoJag2ECC2+2wh8fIqX2cEEa2FISn9M3T8+jk0i6n1YYb3UmgffiuCnmklXe9Q4BeVFxESz1jrXRe4zpkHclgYRa2YhaP2MmkJXQDNFw3FCODhqeTeqCViIw3qjghwY5PU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB5481.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(8676002)(8936002)(5660300002)(33656002)(4326008)(41300700001)(52536014)(86362001)(55016003)(6916009)(54906003)(66446008)(64756008)(76116006)(66556008)(66946007)(316002)(66476007)(122000001)(38070700009)(38100700002)(478600001)(83380400001)(26005)(2906002)(107886003)(6506007)(9686003)(7696005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m+typxppnxfLEsX7TFkhfm9uWwat9WR2o/+2Zfrn34KMFPqB0x8lQQJzJl9F?=
 =?us-ascii?Q?U1NN839KZEq3Ib9DITxtXS3Sra8zxJSgUq1pkSKJbXnpm0U44+DROAmXJP4t?=
 =?us-ascii?Q?OrkEOm2LcVQuNoXRMyXgrBenokuVk13eMrf65QbZ6clOOrR1b+b5rOc2j2Xe?=
 =?us-ascii?Q?c5kN6Iim3fNGh/F3YZ5aTUettxp4R2iiVEPanmEN0vaV3aFzrp5n5AB6W+al?=
 =?us-ascii?Q?cNLTj7EBrCdHXHt0dRfuwPq7A3IhWQ1+6yW/5yo07O4OXtcgSKnrvXwTjWtC?=
 =?us-ascii?Q?oatYTYyqCjgC9Ly9eNvhpbC1Povve6d4f36NMc+Qd3UQjHqFzL5XPLSzxmHp?=
 =?us-ascii?Q?yjSG1A7wQ0OIY+JQbG1iD5vgGxyXq3tCFtZbKuJ6PBj1wNM5zjX889cZ3HEP?=
 =?us-ascii?Q?tZhMBLnUd8Sfa+qiALfV+BIBwcbPCCNYDPBpc1nW4CSt23H61HgyMmWv+4Ju?=
 =?us-ascii?Q?F0wfIRjx4+Mtr53gLDzfFeRtvHHPfpSYENqyPY/qCwR4DSOUHya//38kiG31?=
 =?us-ascii?Q?zeyKWOH7utXST9Nk7kPaNvkT7FRT1HUcJtZqij6FSlvvBvw0jKcM3RGCNcf2?=
 =?us-ascii?Q?jx+RLvxdFXiBPabZzvhlW0keza0bM5DPmQl12JPZJ/yM1IyhDi/uCihH0mOG?=
 =?us-ascii?Q?2/CTb/s4ir89ptGuHpUtP32JAKwPr1RQSHTRRb5WY2akm7WylIZOjvdqtjfW?=
 =?us-ascii?Q?iHINYSO3eQ6w165yA8ghThKNNDH+pBpu8dtvTb+mvEmEG54tGnvudDNhBhhV?=
 =?us-ascii?Q?EFTQv6q658G72JrRuEhBRneycjBP1fRia2sUxLcd0DnCA5Duv+EJOJlbb3l/?=
 =?us-ascii?Q?EMUUUWFQvtDz5CSmxIyCFEzgTYBRGLfK/9bJ1MuPnla1kvHIdr5Fvy0q2JAH?=
 =?us-ascii?Q?80pELkIPn/iHWaMBesWkjP71ylX1Zd1hsvS25i2Ct0sasTfi2KylSxZ7PQUP?=
 =?us-ascii?Q?VaVU3FsLQjdqhIIgRoWxX86+KaRalT45MSzK3Y4qKspz7+soyMjRWyXRQe0I?=
 =?us-ascii?Q?nSkyCpmidO1af2qg9+iHcJMw0ByZlvcVj0WBg3XD8OuLnXcZ9YdUEeMX9mMP?=
 =?us-ascii?Q?TRYr2FjtKYwr0EF1iESdEM5k44OnoYfQeHyABQF9sH8ZZhksoELHFcxBuQWE?=
 =?us-ascii?Q?WEELmgFUlDDAu4QxkgoLC4ORaLgD2jJO9lsY6P2y4mAAxxy0MxuHlXHI+lIv?=
 =?us-ascii?Q?59uFm2PUKH1PVvuN9mIS4KUPSNZ6BSjtXi5d4fP1yU6VgTZlGvQIzD9O5h6Z?=
 =?us-ascii?Q?9tA+2hEIr3OPN+T9OHwPDgESa++2XKZUoOJnai7djKDX+42W3SxpzfT8Ifks?=
 =?us-ascii?Q?h9nYceAuglOXLBdAxEMQp0UOxhombiqqNKtApvMprdfu+xiLsuKOQjDaasX4?=
 =?us-ascii?Q?ZfcNHp7tiZRTSGwLg1qd1t+VhhprbWrJyGlIhGJHh+7i5EQ0rgGMBEArev/C?=
 =?us-ascii?Q?2mfCTChJ1zB4SYYqgQgZUjeOU2wzWvIWAqIzkIUCNZdv+fFLCkQ0SccT3/ke?=
 =?us-ascii?Q?hs8kOPwZoe5144F4I6QgkPwatmRzYBUhdrlK3RAGxtYKAhKssEiJR7VTurOj?=
 =?us-ascii?Q?1lMPtqq7JMct/HfvGYM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2364c5db-3c5d-49c5-9fc1-08dbd6358401
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2023 15:09:13.9070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vmkORtngkUEMRZ3ZeEV+/QdYni0srNplJWG0ezk1lcjhlPsocQA8s31F4A4htNdDzjPBzOr/FZP+A8Cr6c1THA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Maor Gottlieb <maorg@nvidia.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Thursday, October 26, 2023 8:36 PM
> 
> On Thu, Oct 26, 2023 at 01:28:18PM +0000, Parav Pandit wrote:
> >
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: Thursday, October 26, 2023 6:45 PM
> >
> > > > Followed by an open coded driver check for 0x1000 to 0x103f range.
> > > > Do you mean windows driver expects specific subsystem vendor id of
> 0x1af4?
> > >
> > > Look it up, it's open source.
> >
> > Those are not OS inbox drivers anyway.
> > :)
> 
> Does not matter at all if guest has drivers installed.
> Either you worry about legacy guests or not.
> 
So, Linux guests have inbox drivers, that we care about and they seems to be covered, right?

> 
> > The current vfio driver is following the virtio spec based on legacy spec, 1.x
> spec following the transitional device sections.
> > There is no need to do something out of spec at this point.
> 
> legacy spec wasn't maintained properly, drivers diverged sometimes
> significantly. what matters is installed base.

So if you know the subsystem vendor id that Windows expects, please share, so we can avoid playing puzzle game. :)
It anyway can be reported by the device itself.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
