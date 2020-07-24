Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C5222CC6B
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 19:42:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 735C988A09;
	Fri, 24 Jul 2020 17:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wrHJm2FhQ4R3; Fri, 24 Jul 2020 17:42:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5F68888A08;
	Fri, 24 Jul 2020 17:42:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DD60C004D;
	Fri, 24 Jul 2020 17:42:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52356C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3A9368879E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qmOHY-QPbC7K
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:42:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 23CAC87B6D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:42:22 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d7so4869793plq.13
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 10:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XwpNl/RSgSBBWaddv3urfADovlU2IQQNUsOQ5gJRgfo=;
 b=WU9slZt/60VXkdmS1OpvEXJ8mEGSsVlwVeByIAqKlB/4k4px26WInz/NJ5KOpt9C7f
 71G2bwjhucwf/lZMokI1XX2uVD8KUgvc/COEJEVz2m64NkyoZ/IbSDZCGM/fR83z0Ctk
 /0825/9u+PETjTUByM40o6Ma8MVukMZWFS+Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XwpNl/RSgSBBWaddv3urfADovlU2IQQNUsOQ5gJRgfo=;
 b=RQnlwulIxUyET4ozTS5M9nEuK7WVcg/5T8vErWv1QJ0M/md8g6RzIyQtAqjq8EMAJG
 7xVsJMEVVJcEWKNpCXwOh4UknlvvH6b9/bhFNeBoR17y69p7pIHyH+YJbXHUKY2p41/x
 o2lB+d14rQ9WRxvrDFUddCvRm2GEvvie8WlaE4KNLlRTBsRF/EfEr+/ongqUJJBliwjc
 KTnckYCFsiKZQ+P7Zhbu3m9oRV76ZD23F3WWrtUmyDMulMZerc922CPeKwsSZjIu7Ht5
 0rv5dY4XuUe43n11lVaHY7wzdztHPIX0VnW+OhfJpZIni3exFjKYoDYaOGo9AKO1bGP/
 xxUA==
X-Gm-Message-State: AOAM531wOMg4GEM+OSMNc8gjml+yxMMdgHQLBeJFviJTLizB66NP1ilT
 ObUX4ZZjQqtCdSc4ZqdykD8kHg==
X-Google-Smtp-Source: ABdhPJzuAMEgACl6KnJ/cKznCSDX4BZLn6+ziD98Tx6G4Jv3sBo+cq7KrfZKMmeGTt0N9+kxSsv5rA==
X-Received: by 2002:a17:90b:1812:: with SMTP id
 lw18mr208834pjb.70.1595612541740; 
 Fri, 24 Jul 2020 10:42:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id p11sm6540646pfq.91.2020.07.24.10.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 10:42:20 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:42:20 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v5 30/75] x86/head/64: Setup MSR_GS_BASE before calling
 into C code
Message-ID: <202007241041.71B4B3E@keescook>
References: <20200724160336.5435-1-joro@8bytes.org>
 <20200724160336.5435-31-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724160336.5435-31-joro@8bytes.org>
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

On Fri, Jul 24, 2020 at 06:02:51PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> When stack-protector is enabled a valid GS_BASE is needed before
> calling any C code function, because the stack canary is loaded from
> per-cpu data.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
