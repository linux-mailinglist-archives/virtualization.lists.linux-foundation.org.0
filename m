Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D862210D0
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 17:26:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AEA6C8B59F;
	Wed, 15 Jul 2020 15:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E780+3QYf4md; Wed, 15 Jul 2020 15:26:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1FB428B590;
	Wed, 15 Jul 2020 15:26:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F18BAC0733;
	Wed, 15 Jul 2020 15:26:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8652AC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 15:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 82CA989705
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 15:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OoTLTnNyGdeP
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 15:26:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E7218896FA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 15:26:16 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id ls15so3232491pjb.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OVseGDlS5NduALoUhVbQMz2ayVd7lsCazvkJdrEWQVA=;
 b=kYphxsBDglzPvHIBCffGnlCguQJ5Jq0VYcOblzLx7EXfk29Rvu/bG7pBwbBpNwzFXG
 +lD2Fb60wFmiV61BCGzq/Gs9UPJEvIkYkAw7CfcZN9nq8hf6m5XYh4qRJi90dSIrkeil
 VQFSgKQ9JBDSo0SH2E//vgbDwR4wEPOwmojY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OVseGDlS5NduALoUhVbQMz2ayVd7lsCazvkJdrEWQVA=;
 b=bFDH6EIu1dWFDc3Otkbtn0nshVhbozh39uvJq7g7JOIWxRIicQiRGl6As3S41WreDY
 ZKe8ky+6zB3yfGZwRzklJAO1paEkZTXUla3cp/mVez551NvayxD7hMT8lm1CQQ1nDbTQ
 fBSFrveyZXhtj+vkCcLFXhBsHkjmZYx3mtbSWxBFiHT1t+kc6YkYzFaMYEj/9kUO15+L
 56ag1qTl2bMU+4HC+1sUsJuIr0HFPLa+9F0YtyXs/EK+bFL7IT0mOxCUZsCKyTp7l+em
 5b/mjHuLJgQ7Wgu5H0xBqYhvM7iTWvFgxlkcf6QWiHOPReyVwyhAezIKcmRFweGi08N1
 MDew==
X-Gm-Message-State: AOAM530OeuxX9gG6IqL4uAIJIG4uLnVr1VK3CpnVx4MTr83B3ot5QCIm
 MGLbQ/omb5zcrOrKHUPSQGrG6Q==
X-Google-Smtp-Source: ABdhPJztkAQ9Aa2pbyAHIkXtH9WpSQcQHYyGPARbbSQPgrfyf6qes0+MO+jyCy83QwcUYG4c4hENOg==
X-Received: by 2002:a17:90a:e987:: with SMTP id v7mr185305pjy.56.1594826776564; 
 Wed, 15 Jul 2020 08:26:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j17sm2463861pgn.87.2020.07.15.08.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 08:26:15 -0700 (PDT)
Date: Wed, 15 Jul 2020 08:26:14 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v4 70/75] x86/head/64: Don't call verify_cpu() on
 starting APs
Message-ID: <202007150815.A81E879@keescook>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-71-joro@8bytes.org>
 <202007141837.2B93BBD78@keescook> <20200715092638.GJ16200@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715092638.GJ16200@suse.de>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>,
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

On Wed, Jul 15, 2020 at 11:26:38AM +0200, Joerg Roedel wrote:
> Hi Kees,
> 
> thanks for your reviews!
> 
> On Tue, Jul 14, 2020 at 06:40:30PM -0700, Kees Cook wrote:
> > Eek, no. MSR_IA32_MISC_ENABLE_XD_DISABLE needs to be cleared very early
> > during CPU startup; this can't just be skipped.
> 
> That MSR is Intel-only, right? The boot-path installed here is only used
> for SEV-ES guests, running on AMD systems, so this MSR is not even
> accessed during boot on those VMs.

Oh, hrm, yes, that's true. If other x86 maintainers are comfortable with
this, then okay. My sense is that changing the early CPU startup paths
will cause trouble down the line.

> The alternative is to set up exception handling prior to calling
> verify_cpu, including segments, stack and IDT. Given that verify_cpu()
> does not add much value to SEV-ES guests, I'd like to avoid adding this
> complexity.

So, going back to the requirements here ... what things in verify_cpu()
can cause exceptions? AFAICT, cpuid is safely handled (i.e. it is
detected and only run in a way to avoid exceptions and the MSR
reads/writes are similarly bound by CPU family/id range checks). I must
be missing something. :)

> 
> > Also, is UNWIND_HINT_EMPTY needed for the new target?
> 
> Yes, I think it is, will add it in the next version.
> 
> Regards,
> 
> 	Joerg

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
