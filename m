Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA12201D7
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 03:26:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 71D4D2051C;
	Wed, 15 Jul 2020 01:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IfLOW1o0vmMp; Wed, 15 Jul 2020 01:26:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4F99E20509;
	Wed, 15 Jul 2020 01:26:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15A26C0733;
	Wed, 15 Jul 2020 01:26:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4D67C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BA470204EF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:26:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PrvrScnMgqye
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:26:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id C252D204E1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:26:33 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t6so725601plo.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 18:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QcW6VJ7a6fNZ0PIZsgk18a6NvkkANLMdBx3aJx5n2P8=;
 b=LermMRMBuE4iPiQWchn6+Y5pFfVd5MDVGRmaF3jnjgwTdKR/jyEitX2LJuReMi4mm9
 72HL0CcXQKM56+FAnZYuVZPmiR/qQ66O5ltrce83lFbfsyOoE/4E5/KWjnK6n0t8DbHo
 ObrL33Mhy4WP8s4TGuuj8FnCo23Gl7p8aCzuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QcW6VJ7a6fNZ0PIZsgk18a6NvkkANLMdBx3aJx5n2P8=;
 b=b3PEfw2m/FOnDQm46gzTPL5a2B7MsQD7dCaFx3tJfbb8UeUEShX2v5oczRKsWxLGFr
 WRZ59Xoze/cGtTgT63oTJjhjuxkxGphNcu7Bd4L9F1D5b07y9vz/2Z59PaqadIQ1IAgi
 WDraoBhUCPiUsBRIhX8mC/JbBP0LLTLvdOvg/Qff93vWX4ObXd4L65PXMdQZvFwcvgrl
 B2txwMTe0Fw5HPIhBjbmLdMSuUrNovTvqRN7LpEhGfydRcnfHGPzMkwC/vsbkkJRdYn4
 s1uTWRE8fvZKJdRN0tCNIZFVl32b5ZT/zNHQLzWD31y3InZ4lEyyuP3Ps5CPbIKW85lN
 wa7g==
X-Gm-Message-State: AOAM530DgNpFxCQzNVvJ5MpfnLVYMFfr6XdxNNc0sRcGs9Cg6xp5ccd6
 grrPVHM7Vq3H2QYn9ziBPNb0SQ==
X-Google-Smtp-Source: ABdhPJynXpmsAypVInC5Gh/ht68hKi/BQl06Nmv62PrADjPwEOczh3gjFDiDHlExfm6gJO53XV+6qQ==
X-Received: by 2002:a17:90a:2e85:: with SMTP id
 r5mr7576594pjd.232.1594776393220; 
 Tue, 14 Jul 2020 18:26:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id cl17sm250287pjb.50.2020.07.14.18.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 18:26:32 -0700 (PDT)
Date: Tue, 14 Jul 2020 18:26:31 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 28/75] x86/idt: Split idt_data setup out of
 set_intr_gate()
Message-ID: <202007141826.8BA5C1E@keescook>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-29-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714120917.11253-29-joro@8bytes.org>
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

On Tue, Jul 14, 2020 at 02:08:30PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The code to setup idt_data is needed for early exception handling, but
> set_intr_gate() can't be used that early because it has pv-ops in its
> code path, which don't work that early.
> 
> Split out the idt_data initialization part from set_intr_gate() so
> that it can be used separatly.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
