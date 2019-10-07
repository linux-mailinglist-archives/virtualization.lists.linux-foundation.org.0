Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DDDCECC4
	for <lists.virtualization@lfdr.de>; Mon,  7 Oct 2019 21:29:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F1BECF6A;
	Mon,  7 Oct 2019 19:29:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 185CBEEF
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 19:29:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680062.outbound.protection.outlook.com [40.107.68.62])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7ECB489D
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 19:29:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=lCmBR35CGz8h6hs7mAcgNq/RWFYRn8Umf8lvuChT7bQBtoeR6PTJzq1clAQigebO3IG3cl1BC6YxFw0mUxVQTeuZgzFN+8+8NCFLT9Y8gCrEd/q75UeAPvdLs/1MJkVtWcfSDEfVRY6l04aEVu/wIyDKB6vqFxQ+tkOQ6mPMRr/fYGQXoZnySps/JmzIljMs5xi9LsbZsDpcjw2DfiZU4O7pjXtOpmKGSxR9dsmspDEl96E6wgIeCCrEau9enZfAN0Tc0Uc4ePtETj+qARn/LGPBqRE4vGaHTxv55ODIEQxCbtoC/t2sbEPkpelvKgfojsUIFIfY3qOKC5wuCoKbwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ONPJpe0AbrFj6+FCCIflefygHdTt0Cld+Qu7CYsUMwE=;
	b=ogd0k16FQE8KBPxk24GtN8JmCpV2kUBDaJ3L4+h8ynSzb9g7KCCXuzB+7OjeMiiXjYMWUFhANqcOe56zDZELyzuptZveEyGayI6Q5ZZvy+HLgnP1d9D2+aaxCkRPtzkBA7WtqpsCrDS2tcwo8EVZStDdB6/oDQdjVFtTXvm1b3V4r88i0OxKgFKs7e0DogskzWxktV+vzZ0/0U4dGRIy4yrOmsof/I+Nc3Z9Xo12cap4urmxaMqjY4pDhTklqNZayVULwtwGM/TnSs17B5TPgL2L5yDgKwjiGBBhR8FN1GxA6qaTwVlBOMbKmLN34m9zCivhZEes9UaPgMRm0p5hHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
	dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ONPJpe0AbrFj6+FCCIflefygHdTt0Cld+Qu7CYsUMwE=;
	b=dKBl5br6TZIPafe2rGRaKDekti8Cy+6hweJPpzB/AVh3OgWRCOvjdVEh5gJWKfcTS/8kKJUwieV22peNEzhmTw6me6BVRdN6N120FFJmF/AX6U65TeEVupFxWKmg/1X26sgvnzuQu5AVCnJ4fqy68z2tcJE2HkraDSGBWZOMQM0=
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
	MN2PR05MB6912.namprd05.prod.outlook.com (10.255.90.88) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.13; Mon, 7 Oct 2019 19:29:26 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
	([fe80::286f:c413:5df1:4eb9]) by
	MN2PR05MB6141.namprd05.prod.outlook.com
	([fe80::286f:c413:5df1:4eb9%4]) with mapi id 15.20.2347.014;
	Mon, 7 Oct 2019 19:29:26 +0000
To: Sami Tolvanen <samitolvanen@google.com>, Pv-drivers
	<Pv-drivers@vmware.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] x86/cpu/vmware: use the full form of inl in VMWARE_PORT
Thread-Topic: [PATCH] x86/cpu/vmware: use the full form of inl in VMWARE_PORT
Thread-Index: AQHVfURwrG7JjV813kemwOGXD7IdVA==
Date: Mon, 7 Oct 2019 19:29:25 +0000
Message-ID: <MN2PR05MB61419440A3C9FF9CB920BCD5A19B0@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20191007192129.104336-1-samitolvanen@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=thellstrom@vmware.com; 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8314af5d-5b1d-4eb9-afe3-08d74b5caa32
x-ms-traffictypediagnostic: MN2PR05MB6912:|MN2PR05MB6912:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB69120503596FB5AA1B42395CA19B0@MN2PR05MB6912.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(189003)(199004)(186003)(14444005)(102836004)(55016002)(7416002)(71200400001)(25786009)(4326008)(54906003)(110136005)(52536014)(99286004)(33656002)(53546011)(6506007)(316002)(476003)(71190400001)(6246003)(305945005)(74316002)(26005)(486006)(7696005)(5660300002)(256004)(4744005)(76176011)(7736002)(446003)(229853002)(81166006)(81156014)(478600001)(2906002)(86362001)(8676002)(76116006)(66066001)(66476007)(91956017)(14454004)(6436002)(3846002)(64756008)(66446008)(6116002)(8936002)(9686003)(66556008)(66946007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6912;
	H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sots98vnudO2iJgRJHKwklC+krB10B8BMcpTAt6BgYSZ50SxnKkGXvYfMLGG8C8YjsaHi3iFvLGcbLmlW2gZonyN3QrxFqqQWHKEzFWGrVVMd+OFZAXWdPQ/V1SqsbpofacWDst8CqC3e47KfdbfQR1QmXs8zIAzogCzFY3drgckPN+0Pp+/ZKsEqpPJL58jPBRTqYPirl6Wxy5jYYTdtYEop69Corm8tE3UNMbLnKc0LZGqNSF2pC54c3DjYS0wPF6UGYYzLWPl4HEgxcBs4PjV1sHfWXcOORpk+C12YAI0L2eRCWy+zpGusgbcXGlLJrqBjNk3gXCIci10vQOaFUWwaiv+AF97iQKnVHvlMP76HkZPZHIrokcbiC1Qv2IyN/iONDACrhngWplz7VhcPs4+Pa9++SEQDRs72YNOseI=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8314af5d-5b1d-4eb9-afe3-08d74b5caa32
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 19:29:25.8468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V5etzFhNZZ2Wr/12WoULnQ+iOCMY5vynmCkPI5iSobh1Z3uvF1rox7eZJuVxBRzx3RoNIdIesHtLYrmOgitvDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6912
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kees Cook <keescook@chromium.org>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
	"hpa@zytor.com" <hpa@zytor.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 10/7/19 9:21 PM, Sami Tolvanen wrote:
> LLVM's assembler doesn't accept the short form inl (%%dx) instruction,
> but instead insists on the output register to be explicitly specified:
>
>   <inline asm>:1:7: error: invalid operand for instruction
>           inl (%dx)
>              ^
>   LLVM ERROR: Error parsing inline asm
>
> Use the full form of the instruction to fix the build.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Acked-by: Thomas Hellstrom <thellstrom@vmware.com>

> ---
>  arch/x86/kernel/cpu/vmware.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
> index 9735139cfdf8..46d732696c1c 100644
> --- a/arch/x86/kernel/cpu/vmware.c
> +++ b/arch/x86/kernel/cpu/vmware.c
> @@ -49,7 +49,7 @@
>  #define VMWARE_CMD_VCPU_RESERVED 31
>  
>  #define VMWARE_PORT(cmd, eax, ebx, ecx, edx)				\
> -	__asm__("inl (%%dx)" :						\
> +	__asm__("inl (%%dx), %%eax" :					\
>  		"=a"(eax), "=c"(ecx), "=d"(edx), "=b"(ebx) :		\
>  		"a"(VMWARE_HYPERVISOR_MAGIC),				\
>  		"c"(VMWARE_CMD_##cmd),					\


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
