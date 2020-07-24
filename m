Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 841D122CCA3
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 19:54:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 21C0320365;
	Fri, 24 Jul 2020 17:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tv-3G+O3egii; Fri, 24 Jul 2020 17:54:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0FFF820422;
	Fri, 24 Jul 2020 17:54:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4774C004C;
	Fri, 24 Jul 2020 17:54:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA284C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D8D4F88A09
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z3cLOw9xTpO8
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:54:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5315B88A02
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:54:40 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id m9so5616107pfh.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 10:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3zh6CKPu9OXN15zjWZk7WlElaxcoMcysSL6HQfo9H3E=;
 b=BbNuGRub6gajP1oXDi9LwdUymaGqj51igXR8/6ZLQKhDEfSjyi+vtEXaLGXxlqngob
 kJegiFXVFS80BXaVFZw1O/OKTg/9rxDkgjecPYAyHkfgMBDh/BX8tEvs/bqrbasncZoZ
 RQVIid6OkNAf+JNeU/aRV3dfwXuwxI59wPrxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3zh6CKPu9OXN15zjWZk7WlElaxcoMcysSL6HQfo9H3E=;
 b=CFQEBcsLq5B3Kt4Bdz1fnMGz6keY+Fkd3ljRdl0Mbx2D5wOe1nBP41CkIhodh9VERp
 qzlN5+3E5AmxD8d29GdOqECh/vjSf2dwFVtKNZqZ0U/VTVYqeKY67sBtP1+2cYDO1t9J
 anFc9G/VK8lCgYXwnQwf/nXOnCsnHBcpPTLAs7K0KTwrhZxJQsxLwdTuW23PpHdHz/Sm
 xLBzXfGmHXNoBTl55XCraCt0EugubpUAKwe9u9D5Lve/Hv7KCS9lNHNke8Fvnkg1b/fo
 +YPmf1UbOVBi5JBaIMh2dfRenpPSPbf1SfkPxxgYYeC9pNl60IvjBOMfoCM0vlPJakjn
 Z6/A==
X-Gm-Message-State: AOAM530ftt617bfEtC+ncYh0F4S0McBVXWg6lDIRLhHSfURFfeFLmu0S
 7q3SVp+9d2ytxzgg65fb6xODfQ==
X-Google-Smtp-Source: ABdhPJzI1NNk18MRpvgt6+LY08/9F3MGjY/+aI5dG+MQzucT+SD3uVmkPKkrl3cYefTv0keng+DOCg==
X-Received: by 2002:a63:3d01:: with SMTP id k1mr9236832pga.71.1595613279983;
 Fri, 24 Jul 2020 10:54:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d29sm5683851pgb.54.2020.07.24.10.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 10:54:39 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:54:38 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v5 38/75] x86/sev-es: Add SEV-ES Feature Detection
Message-ID: <202007241054.25B564BA61@keescook>
References: <20200724160336.5435-1-joro@8bytes.org>
 <20200724160336.5435-39-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724160336.5435-39-joro@8bytes.org>
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

On Fri, Jul 24, 2020 at 06:02:59PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Add the sev_es_active function for checking whether SEV-ES is enabled.
> Also cache the value of MSR_AMD64_SEV at boot to speed up the feature
> checking in the running code.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
