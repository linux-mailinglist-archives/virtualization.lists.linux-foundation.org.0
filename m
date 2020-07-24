Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF2222CC9F
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 19:54:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3070788A02;
	Fri, 24 Jul 2020 17:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Byl8I26F1lgy; Fri, 24 Jul 2020 17:54:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A92E388A09;
	Fri, 24 Jul 2020 17:54:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FC47C004C;
	Fri, 24 Jul 2020 17:54:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17F19C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 135B1888D1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3uAb0tTsyRc5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:54:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 818FB888C7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:54:11 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id j19so5689133pgm.11
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 10:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=LlWadNnJdj0hYYYVqCSZw2hjiyDxpJ2Kj8kn/NHt3FY=;
 b=atxoVVvNQ3oTazgRIDpHxSGrFLt9cvtoIBlvch0KQdY3aDyXvLQIdUzTcezi4vTG7R
 p3oklZStvCkO8gbZjqGkGxlAitCYYYinGGGKXpTA/1ZkFvIU2Ri3ri/cv2Fi2+1owHn3
 aDPZiQhkJ2XnheLh3/Pzmn1G0Q2Js7lTuAUNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LlWadNnJdj0hYYYVqCSZw2hjiyDxpJ2Kj8kn/NHt3FY=;
 b=dvUsE/ZLstAaeh+5dZw8LisOksMvWCAZq5p9KvpF0gwaDe5AqU7LajQASlWD8xHRR1
 wedsFJkizweR4cW5LPn+q+RNpUhkJuv6Hr3NXxyISL2SiKqLPAPgRlU9U3mO54MOMzbl
 nda0PJXma2W95c8oH8dCfprr4oN+tIkCILh//ruxVpCoVlZJxRDqfakcUOKKp1LEO3Rg
 8/uAQfEsR1iKo7xviCj2s2BHiHW/l7dvGmAq2vtT/XcEha7rWf5F44z0kfFHpgV77S/K
 BAfqlixfWORRPfH8nbhe0B/ATAQ62T71V68yhctsiriPRS2bK84i7qaHvPCjbCIPT5uD
 ySAw==
X-Gm-Message-State: AOAM531ymkYV8jKrbszV2VZwsXlLXTadUPH1hI9O/XAc3gu8f8o9iDU1
 fp+ddelOA5hR0s8a5EwHKJLSSQ==
X-Google-Smtp-Source: ABdhPJwAqrIfdoT4BFkrasAiJFdaIdj3r/Ze/FIypWTH8bIiiBhHfRqSOlNvvGH0vC6qTvZaO894kw==
X-Received: by 2002:a63:e241:: with SMTP id y1mr9814521pgj.410.1595613251093; 
 Fri, 24 Jul 2020 10:54:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id my16sm3221207pjb.43.2020.07.24.10.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 10:54:10 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:54:08 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v5 39/75] x86/sev-es: Print SEV-ES info into kernel log
Message-ID: <202007241054.B7E226E8@keescook>
References: <20200724160336.5435-1-joro@8bytes.org>
 <20200724160336.5435-40-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724160336.5435-40-joro@8bytes.org>
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

On Fri, Jul 24, 2020 at 06:03:00PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Refactor the message printed to the kernel log which indicates whether
> SEV or SME is active to print a list of enabled encryption features.
> This will scale better in the future when more memory encryption
> features might be added. Also add SEV-ES to the list of features.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
