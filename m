Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA8A18B106
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 11:18:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B574087D05;
	Thu, 19 Mar 2020 10:18:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7qzIvegyMXZz; Thu, 19 Mar 2020 10:18:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 331F287C1A;
	Thu, 19 Mar 2020 10:18:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24DD6C07FF;
	Thu, 19 Mar 2020 10:18:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51B16C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 10:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 47F842153B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 10:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1dErfvCkGRe8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 10:18:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700080.outbound.protection.outlook.com [40.107.70.80])
 by silver.osuosl.org (Postfix) with ESMTPS id 3C92E2050C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 10:18:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1tkatth7CVsiYa97rHxPe6DLDeBKavCWicnLBhbNnNa6EOSbMnYlyjwLcafGmGnj5OEUISVo6lEyTCebtmqyHGWqCWZ/aL/m6LbyIWfc69hv/157TLxjVdJ6CM93vbrBi+KLK7aYDAea1A9GlKeIGjqC8n2++Zvsl+R1DhYHrUO1dDjoneVvC6r3u4pxkqtDpvitXT+zT92k9bXVP5nVerMqRWhpcduKVd6MfXFijKdmSQZiadIxHkI05/3RTAGdblJoUlp2DwsEy4/JI8J2LMi1rfi2p/3s6c08rdt4BoVQnd0Gi4bJtHiPoTHQh59IGWI6icnkJhmwqRVUrfjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo8e0pXhkGwPQEZRTSw0aOdffc0ir1EEXwgAoYdFxcA=;
 b=jLSG179RhSQqdJDSWyMX/rtaxuAM0qTSbqkFYnZKsuDY1qrWSXFsH5zHuHsshKj2QuoEj0SbjReN4ABqwUO1I79HnSny3GQ7p+1DgUH8w3XcECaJg6evDpwSjRJKMZSmOru6DIjo5sqo0o9xeOWW6KBxfE8FQKfUv/R7drgyyT+AUFNOrVbZZjR9zpVfPujEC6hbwBvh94nLlbszvQ6hQOcxCKCW/QrD3fwS5az3zFTx2qDbXJcsRQgoh5aFMXw7/5rpFAhVMcZ6OLndRpkYJemXNmN2w8HbeKK17vPhPQ5dGRgcyS+aHUdoOadeKplkhT3d+Zs3ZG+EmvAP8txRFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo8e0pXhkGwPQEZRTSw0aOdffc0ir1EEXwgAoYdFxcA=;
 b=aL/kN99qUGitTqWObhgqhfPe98f0Sl2IiL/rrDWEYE5m7vzidFJZwERh5DLxPYYXoKS50Boc4Qh5oZmW8Czr2DvsOIZam7R3ZpG4og3KYDWjrMg9L+Pu3i6jJWS9Ob0KKSi0B5fsfLL6FR8c6uWiuHgvJaxcQANhE5eaeltPjsQ=
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (2603:10b6:208:c7::25)
 by MN2PR05MB6430.namprd05.prod.outlook.com (2603:10b6:208:da::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15; Thu, 19 Mar
 2020 10:18:09 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::d811:e1e3:563c:b15c]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::d811:e1e3:563c:b15c%5]) with mapi id 15.20.2835.017; Thu, 19 Mar 2020
 10:18:08 +0000
To: "joro@8bytes.org" <joro@8bytes.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH 63/70] x86/vmware: Add VMware specific handling for
 VMMCALL under SEV-ES
Thread-Topic: [PATCH 63/70] x86/vmware: Add VMware specific handling for
 VMMCALL under SEV-ES
Thread-Index: AQHV/c7ZOteOIAWN8UyHhBoVBotVIqhPs7+A
Date: Thu, 19 Mar 2020 10:18:08 +0000
Message-ID: <5abc70ce42e1445b8ae097a38951b0aa6f67bac8.camel@vmware.com>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-64-joro@8bytes.org>
In-Reply-To: <20200319091407.1481-64-joro@8bytes.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5 (3.30.5-1.fc29) 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b707c62-5402-460e-4e63-08d7cbeed264
x-ms-traffictypediagnostic: MN2PR05MB6430:|MN2PR05MB6430:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB6430931CC0072E0121F26722A1F40@MN2PR05MB6430.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0347410860
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(39860400002)(376002)(136003)(199004)(36756003)(81166006)(8676002)(81156014)(8936002)(66446008)(91956017)(76116006)(66476007)(6512007)(66556008)(66946007)(4744005)(2906002)(64756008)(2616005)(4326008)(6486002)(110136005)(6506007)(71200400001)(478600001)(26005)(186003)(5660300002)(54906003)(86362001)(7416002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6430;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tCCzaZjQ87474xfvc8a7iF8QljXkWir31FB1ldl1y33ZF4yTmnaSTO3r56xrZ+QDDLbo+c/vQqyJM0zBto9qNdP5CGXTJQhGdV4Nq6YlZo+wOy+sdZICfsZa0HTWBPKn4zv7ENpPKyJodsQuiGqcjcQZPwQHFBcDDl2q7N8jAeef2dMv2ERuDryDStFWQ4UjRz5ZMi1YOggyP2whnvYnHNYAwm6SZgEs/MpNq4KvHV69g5zqHvIqHOCBkzCsXonlNhq38iEP0W15z59HiGZbNCJiJvpX9brpsa7VrfXwWlKotPyIZTNRN4zNTg+Kc4e12DSaQ5bguaaFFHNOhRl/WPUO4qvof5F4Brbf5RT6C3pw7BwpdMY8v27Z3L4aPP5k7EUq/In7eUrTyP7F5hwU4YtRxgmsD9TrLF5tfrMw4Qq/3xpNcwCJiAA5QNai+sOg
x-ms-exchange-antispam-messagedata: nEc/RJF+4teV1+NBaqg2KQikDnco/cHkELcTJKqVlQvnZOYdr/6wj06u4yVo62eOQX3gMazeBCfHu54Y2rlUXo/3JS+kSSQNGMkYtwuaFMjkkkllSlbXpASlNXEP8TYhTlhq+IK6IXi2cPf5AnexZg==
Content-ID: <AD4E5ECE942544418011A3A4E96E3198@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b707c62-5402-460e-4e63-08d7cbeed264
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2020 10:18:08.6509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9ucOi0ghDSiwEzRa5tPWsYL+W3xeKqBM8PrcQriWFR3uPxaok127lLcB+GgupNAVp/dgOqZEkHXuND53Lbb2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6430
Cc: "jgross@suse.com" <jgross@suse.com>,
 "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 "jroedel@suse.de" <jroedel@suse.de>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Doug Covelli <dcovelli@vmware.com>, "luto@kernel.org" <luto@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "jslaby@suse.cz" <jslaby@suse.cz>
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
From: Thomas Hellstrom via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Thomas Hellstrom <thellstrom@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, 2020-03-19 at 10:14 +0100, Joerg Roedel wrote:
> From: Doug Covelli <dcovelli@vmware.com>
> 
> This change adds VMware specific handling for #VC faults caused by
> VMMCALL instructions.
> 
> Signed-off-by: Doug Covelli <dcovelli@vmware.com>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> [ jroedel@suse.de: - Adapt to different paravirt interface ]
> Co-developed-by: Joerg Roedel <jroedel@suse.de>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/cpu/vmware.c | 50 ++++++++++++++++++++++++++++++++
> ----
>  1 file changed, 45 insertions(+), 5 deletions(-)
> 

Acked-by: Thomas Hellstrom <thellstrom@vmware.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
