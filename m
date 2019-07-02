Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 989C27375F
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:07:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2FA7614FA;
	Wed, 24 Jul 2019 18:59:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 30409CD4
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 22:57:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2B2A970D
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 22:57:00 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id bh12so89334plb.4
	for <virtualization@lists.linux-foundation.org>;
	Tue, 02 Jul 2019 15:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kws1-com.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:subject:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=UUddiIZlUeEFIm8OCaTLrhZgsjjz3PjqF9gILo6fL48=;
	b=HOrhmTHVwXz/HiCs+Ipia6bylf91pIb/XW3mpLmB1rUbrewy5DqoL6MAEY8O2MBTmg
	uzJWSxP4phgkYRZ4m7xkONhpGHfxKm/wX1c0baWTqZQlej4RXkckEzdFcd/trZF13R+J
	LCGa8c+OehLX0YzqXrUqcyL8k5g37RS2dIgAQXjOqEF+ywynwszBy78DR1qkyOHroGdZ
	5DhAi3kCybVO+e9No9h/3X6nfRCiOlyKEiAMrxHQFhnyBwrgiB4RwKEFuj/+2Td3zuXq
	8uDlxUMPYeyG5oDMl0X6oWXpMv1Ol58eJXc4xtKmuirEX3WcS4deoyjSGt2EP8qPhd4l
	7Avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=UUddiIZlUeEFIm8OCaTLrhZgsjjz3PjqF9gILo6fL48=;
	b=QbuX4N1EtCt4ktRI25z0M6hfcyyZHd6+sFTubPRZ5X27BDQj7QcUo4RM4dRuRz1RY+
	gLfiE392AZOyWyawoBrE7a2ymF8Mn66XYXnJqcBMoAPcHunlQtlVwHeWktJqM8kODeQw
	uxAMFWQW4SmOV1qd1zHu0qjyrJublD3vt7qxvjk1ENItzjPqxzYWJRO6LX1TzEbVBhIi
	T2ptMxuziEZqlxHLEOK65iac8mMHuaUuiIR9XsMLKW0YK6zluytuGcNNfWlXPg/mK6LQ
	B1OXO5V1uwQDxRjurU25i7HkW/DDpNWlOjGCCAwG3OSCadG/Hetpoj0L97z46A7iFFGx
	f/9Q==
X-Gm-Message-State: APjAAAWxFl4Tot5kzgrMHQetfB1nnGiPZZeiisMmNMt+ctC5Ur+o141d
	ptwuwzlIenGXh/OeyLw8UeaTHGU2a88=
X-Google-Smtp-Source: APXvYqy6bi5ONJpvZw/XGaZHcZyLu8SgGQY66fzpXF+PSNrW+RcLFafhX4E2twjZLQjuWXm+pfjInw==
X-Received: by 2002:a17:902:2ac1:: with SMTP id
	j59mr38376871plb.156.1562108219174; 
	Tue, 02 Jul 2019 15:56:59 -0700 (PDT)
Received: from [10.0.51.186] (rrcs-69-75-77-27.west.biz.rr.com. [69.75.77.27])
	by smtp.gmail.com with ESMTPSA id
	i15sm118218pfd.160.2019.07.02.15.56.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Jul 2019 15:56:58 -0700 (PDT)
From: iggy@kws1.com
X-Google-Original-From: iggy@theiggy.com
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: What are all the different virtualization solutions for Linux?
In-Reply-To: <SG2PR01MB21414F5E77B7E49670E8444A87F80@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Date: Tue, 2 Jul 2019 15:56:57 -0700
Message-Id: <E762A459-99D7-44F2-AEDD-B74CD94EB4E3@theiggy.com>
References: <SG2PR01MB21414F5E77B7E49670E8444A87F80@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
To: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: "virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Saying `kvm` is a pretty loaded term. There are at least 5 frontends for it that I know of (qemu, firecracker, nemu, cloud-hypervisor, crosvm, etc).

Are you looking for strictly open source options?



> On Jul 2, 2019, at 5:56 AM, Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com> wrote:
> 
> Good evening from Singapore,
> 
> What are all the different virtualization solutions for Linux? I can think of:
> 
> 1. open source Xen project
> 
> 2. linux-kvm
> 
> Are there any others? Is there a comprehensive list of all virtualization solutions for Linux?
> 
> Thank you.
> 
> 
> 
> 
> -----BEGIN EMAIL SIGNATURE-----
> 
> The Gospel for all Targeted Individuals (TIs):
> 
> [The New York Times] Microwave Weapons Are Prime Suspect in Ills of
> U.S. Embassy Workers
> 
> Link: https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwave.html
> 
> ********************************************************************************************
> 
> Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
> Qualifications as at 14 Feb 2019
> 
> [1] https://tdtemcerts.wordpress.com/
> 
> [2] https://tdtemcerts.blogspot.sg/
> 
> [3] https://www.scribd.com/user/270125049/Teo-En-Ming
> 
> -----END EMAIL SIGNATURE-----
> 
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
