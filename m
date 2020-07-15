Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A02201DC
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 03:29:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B346587856;
	Wed, 15 Jul 2020 01:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQXec1R4oAMQ; Wed, 15 Jul 2020 01:29:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C14AB87850;
	Wed, 15 Jul 2020 01:29:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97FADC0733;
	Wed, 15 Jul 2020 01:29:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF8BAC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B882C88F6B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iXzqpGzuEuZk
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:29:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 189DB88F2E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:29:29 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id a24so693907pfc.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 18:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=E7jBTUN+q1MFSKfnbOqN34m9kwFSgfqPOQP4XPd3q20=;
 b=TNYBRU3rt8vQTV68BnfmZdJfy3duhGTQeyyt+yRIYHSFoG9BCK31dGBtdbo1N+7tbt
 hrI79dVb1fe0ntLBKMc4WL1x6kMHbfxRiEDmzwpmQialwoYqiYVbPw6KH1WAcausmpbJ
 J7PsSsy2KNGZvf69+Tloxy+LXK3NkkzxsHi28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E7jBTUN+q1MFSKfnbOqN34m9kwFSgfqPOQP4XPd3q20=;
 b=KqWs0OQojCOqGrJEKAo3hgFEgTKfKdqU6EZuLAonqpxgu+gYLs6pEPrdnYiGPVkgQt
 xK5bxuN9Rd1LgVDC4o3MTqtYVQcy0CIWhh1FsqDwYieWO2tl0tLzA8mp0rHTN/x/ABul
 KDakyzOuLh7BuKEvkmUwcYhdRDDfPNEYW+VH5v9k+rguJ70I4WVxaI+466x+f+c8RH/q
 Bxh3BSYAopVBNwcGAboZlKKjgGnfDjYMV2fGIgcs43IGOt1WvSDwrCMJzJGI+ZQDcGRr
 asYNc0JtzJPbYgZllRmA437uTZgmh7nAVd4f2V1+A8Rh6ysxg81RbP/YS6jifYF+E1tF
 w/zg==
X-Gm-Message-State: AOAM530Itvh4eJAjcjR2bCHSi0SFnrr08mfsGWw3yOeDDQIZWUSQmboX
 CHlluJRdFcWT5f0DMRvwiqspsw==
X-Google-Smtp-Source: ABdhPJzuAx2MU3/IFIN5Fo5Om9COSAdzzeAOeGxBQatzJZdo3a9WrMaQ/5hz7S1dWNOewUMx6ayNgg==
X-Received: by 2002:a63:308:: with SMTP id 8mr6053673pgd.112.1594776568754;
 Tue, 14 Jul 2020 18:29:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d37sm311670pgd.18.2020.07.14.18.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 18:29:27 -0700 (PDT)
Date: Tue, 14 Jul 2020 18:29:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 29/75] x86/idt: Move two function from k/idt.c to
 i/a/desc.h
Message-ID: <202007141827.5A5D64454@keescook>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-30-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714120917.11253-30-joro@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
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

On Tue, Jul 14, 2020 at 02:08:31PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>

I'm not a huge fan of the Subject. :) Maybe:

x86/idt: Make IDT init functions static inlines

> 
> Move these two functions from kernel/idt.c to include/asm/desc.h:
> 
> 	* init_idt_data()
> 	* idt_init_desc()
> 
> These functions are needed to setup IDT entries very early and need to
> be called from head64.c. To be usable this early these functions need to
> be compiled without instrumentation and the stack-protector feature.
> These features need to be kept enabled for kernel/idt.c, so head64.c
> must use its own versions.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

But regardless:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
