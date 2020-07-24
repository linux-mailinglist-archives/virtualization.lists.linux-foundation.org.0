Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D9A22CC70
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 19:42:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D2BDA88828;
	Fri, 24 Jul 2020 17:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KZsPhzE++66p; Fri, 24 Jul 2020 17:42:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9F50787B08;
	Fri, 24 Jul 2020 17:42:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CDA3C004C;
	Fri, 24 Jul 2020 17:42:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4213EC004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 206CE24B3A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GVarIGQP0UW
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:42:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 38E3A24A5C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:42:53 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d4so5681422pgk.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 10:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=U50zr+VshRe9mYuWVqDq7CNgzIqrkIfFylK6XexbWKE=;
 b=esEqwYwiF2m2i9Gp06Apxexvboy5U9ul9g68MueBSxJcjBjMQGdvHGFDnJJQap3xxR
 XhM4nWcCt/BWatQmNXYxfbnHeLB+cwvvzLxCD3ArVYYAeiHf4g3zESPK5T2qMVj5A4ft
 EhlkS/H1Gn677G/SsxoYiePReMo8rMYLkY4yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U50zr+VshRe9mYuWVqDq7CNgzIqrkIfFylK6XexbWKE=;
 b=ZFUJ94Oz+ZqH+sDGMnJ76T823j+/b5pR8hBOZNRcJXZJkMNZIRMfb4UmBcT2n24gPn
 j6Qh8kDrrPGKznY0Gaep6dJzgRSiLB76NyDHxkmJk6x16piZuVo7G6+zbIgcLQe/kHcI
 isa+Q+SUIqOZAG3+95qZsK9x3Qr3k1eoCfWGxuBNtP8bb+gnQOC2es32sNVlxg58inxX
 ealuiqJghbE2QPBXb4LBaJJzZZ2s1mSS8jwP+pW7WTSctUXrVDh0gdJZqBhL0dXaF92P
 jiObzk8MihEAlrr5T9Ucl5iA89GolodAZbO19PqvJmtbeBkbD0R0M/HXYzST1UyiK1iF
 M1BQ==
X-Gm-Message-State: AOAM5339cdJTzqC1BSvD3R/wYG9zWvhItcNV/Kog7b2W6FRKTtEp40e+
 ZKfRG1bE6nBpqSfJfXOojQJjCw==
X-Google-Smtp-Source: ABdhPJxtKpo45I9LuQoJECycYCtMUIABAY1HmaYIM7v7qjODgmc1ompAK4OP3e0iHW9NrkeIeAJbeA==
X-Received: by 2002:a63:fe0a:: with SMTP id p10mr9318212pgh.255.1595612572909; 
 Fri, 24 Jul 2020 10:42:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id g28sm6772558pfr.70.2020.07.24.10.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 10:42:51 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:42:51 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v5 32/75] x86/head/64: Load segment registers earlier
Message-ID: <202007241042.D3E8FC382@keescook>
References: <20200724160336.5435-1-joro@8bytes.org>
 <20200724160336.5435-33-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724160336.5435-33-joro@8bytes.org>
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

On Fri, Jul 24, 2020 at 06:02:53PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make sure segments are properly set up before setting up an IDT and
> doing anything that might cause a #VC exception. This is later needed
> for early exception handling.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
