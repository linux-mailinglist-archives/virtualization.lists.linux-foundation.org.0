Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F1A159C81
	for <lists.virtualization@lfdr.de>; Tue, 11 Feb 2020 23:47:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E96E58458C;
	Tue, 11 Feb 2020 22:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F9LjPAA1cNrV; Tue, 11 Feb 2020 22:47:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7B7CC8455D;
	Tue, 11 Feb 2020 22:47:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6167DC07FE;
	Tue, 11 Feb 2020 22:47:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B30ADC07FE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9F146838D9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DPg+32zVrBGA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:47:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 378F28362E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:47:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9ABF2082F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 22:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581461238;
 bh=8846fUtTtG1u5dbmx7PL9BsCMN38k37aj9KG0jpXB20=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GdwV6pGjP1QMeQ9Q+I0Qe8Mkkt024wfIE1N1G7WKC38gYA+19B9en7ircBqB3Qp2z
 aTsU9i5zrWlfJ8kqZFxfKVJUIAmx7Pg3EQOCVPBYGv/sJ6X9dDOWNp6t9yy1e3HEV3
 WirIIuFUK4W1YI+iIr6C5Y+vFyNAdx4AoCF1r1HA=
Received: by mail-wm1-f52.google.com with SMTP id p17so5778662wma.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Feb 2020 14:47:17 -0800 (PST)
X-Gm-Message-State: APjAAAUV+HpSlx0DZudLgRL6AnX4/jFP5AJZ8KJm8w+rKQ8IQvjhAX8K
 6gPrITpFJscOZ3pKF+4SrHZCF7BI0jCd25Z6xc6gYg==
X-Google-Smtp-Source: APXvYqwLMFfykA+lJO+JrGtvf5tixGtL0MJifVbP6ZDH2lGW5WHYfqpx8LjEVH0nOFYUqKIXHF9G/pYzuXtkAs32brE=
X-Received: by 2002:a7b:cbcf:: with SMTP id n15mr8161092wmi.21.1581461236365; 
 Tue, 11 Feb 2020 14:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-40-joro@8bytes.org>
In-Reply-To: <20200211135256.24617-40-joro@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 11 Feb 2020 14:47:05 -0800
X-Gmail-Original-Message-ID: <CALCETrXnFr47OEDk8OYrHHW=1XNAQMUB=wPevhLM6ROnO6_Rog@mail.gmail.com>
Message-ID: <CALCETrXnFr47OEDk8OYrHHW=1XNAQMUB=wPevhLM6ROnO6_Rog@mail.gmail.com>
Subject: Re: [PATCH 39/62] x86/sev-es: Harden runtime #VC handler for
 exceptions from user-space
To: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

On Tue, Feb 11, 2020 at 5:53 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> From: Joerg Roedel <jroedel@suse.de>
>
> Send SIGBUS to the user-space process that caused the #VC exception
> instead of killing the machine. Also ratelimit the error messages so
> that user-space can't flood the kernel log.

What would cause this?  CPUID?  Something else?

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
