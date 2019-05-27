Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CDF2B088
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 10:44:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BAF7C160C;
	Mon, 27 May 2019 08:44:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6950A14AF
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:43:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1463713A
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:43:50 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id g18so14120554otj.11
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 01:43:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SPyeTzPFoh+1jcHD1T6EeO+I9ugNzJgCyHNSVSPB+Tc=;
	b=YjUDh4x7Mhwx5F6gXWEkThR7AWQBHlNEcejMtyMtAaRrn64iC8iO8hFU4Bax24EUSd
	z3eQ2q8QoKA7+xc2jLKMiLFAcTDc8RFoIIeLMu+7AV8MVzwgos+WqfvDUzK3Tv22JBnT
	y2leTXgtAC3s7ztgnYIo1Pncc5MOt8Uhdt72SdP7+mQMddjHdZjErM8VvbJdnjyLi2ub
	RSwWcGzzG3I/x42Mb4l8utSDR+avOY2qYJjc/JspiLiReOZV1igNxB0lT/h1JGGZUN19
	FQbKknvjzBbQCGxdGt2NPybef7Cvx4IiPRRuXYdLA+i0wABo+dB2zmVfGw9MTg53c9bu
	m01A==
X-Gm-Message-State: APjAAAX4eYaqMwPV5tETjvNeM+4zFMAbjnqAqMe612AjHjNq5N3CeYGs
	LlZClFFsmClWWMtg7OzirWrxkql26V2tahwVLDcZ7Q==
X-Google-Smtp-Source: APXvYqxIlLFH84yhUFerMj/YlUDBNDBRTGJTxhPDFRXnfvuo7mYZbz39ugxbhoZlfat/iRijWwRpROWfadWrjYSeMCE=
X-Received: by 2002:a9d:7dd5:: with SMTP id k21mr43860970otn.167.1558946630255;
	Mon, 27 May 2019 01:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558362030.git.mchehab+samsung@kernel.org>
	<4fd1182b4a41feb2447c7ccde4d7f0a6b3c92686.1558362030.git.mchehab+samsung@kernel.org>
In-Reply-To: <4fd1182b4a41feb2447c7ccde4d7f0a6b3c92686.1558362030.git.mchehab+samsung@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 May 2019 10:43:39 +0200
Message-ID: <CAJZ5v0iiSo=yoyZTt6ddf5fBRGy1wSvzmA-ZaHH33nivkSp22Q@mail.gmail.com>
Subject: Re: [PATCH 10/10] docs: fix broken documentation links
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Linux PCI <linux-pci@vger.kernel.org>,
	Platform Driver <platform-driver-x86@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	linux-kselftest@vger.kernel.org, devel@driverdev.osuosl.org,
	Jonathan Corbet <corbet@lwn.net>,
	the arch/x86 maintainers <x86@kernel.org>,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	xen-devel@lists.xenproject.org,
	"open list:EDAC-CORE" <linux-edac@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@infradead.org>,
	linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
	netdev <netdev@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-security-module@vger.kernel.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

On Mon, May 20, 2019 at 4:48 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Mostly due to x86 and acpi conversion, several documentation
> links are still pointing to the old file. Fix them.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

For the ACPI part:

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
