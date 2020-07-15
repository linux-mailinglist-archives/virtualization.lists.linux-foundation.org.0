Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C852201C1
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 03:24:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E12EC88294;
	Wed, 15 Jul 2020 01:24:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0crGIpf3-lan; Wed, 15 Jul 2020 01:24:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0471388261;
	Wed, 15 Jul 2020 01:24:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFCEFC0733;
	Wed, 15 Jul 2020 01:24:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47877C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 422BE88261
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmIVgn-mhMPg
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:24:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 322CB87FB9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:24:09 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id d1so701697plr.8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 18:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rBR5AjI82R5bYhOng71+5jFKvQ0oN6P/Kk11F4Z3+zk=;
 b=n+kU5hvp8QX2eErdqh0W7QLokIV7OjxOGug3362dtYmAU15jXA2quaw1LOjlA2OxHr
 grTkzjMkDFKiGgnsiQ1p2YDXLg3DuC9x59mWeMy98rbQ5Kngg7FI+StxG6d9e+/dJMkM
 ujFENwTUf9nN1xF3xXq+X+clzZw1jOue0CTl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rBR5AjI82R5bYhOng71+5jFKvQ0oN6P/Kk11F4Z3+zk=;
 b=ofNpsKn4WCnVi/B0sHpffoyFGp/fvBZWqigb+HQeYyvVON7zO7CYONBNdxMseVINsN
 X7MYzzwaBoL02VBRmkLivBjvoW3SCehBgBBuK+SzFEzApPNawjcfvUGPoT43QVZhBL5P
 MYVHUr3CCNQZplY5OyU+Z7/ierCAEN3viNS1x26vwbbXmaL4zuZZqgezX3Vs2msfNDrR
 pySKoqUk25KEEU0SKKg3y2zz4sa7e3mZ5UWwaJD9NDTOTlgl/0rzGekPmDDuEDLJbzbc
 RYKDqQ/K+HbyCGY5g+SOqXEwc7QxFvc6UCoD8m5X+zy0b37VtttmUavj0o15BQruylHb
 uSPg==
X-Gm-Message-State: AOAM531PwAgqDPW8e4fWHWulnZPV7XVyWrwK4KplYjCKM0RGy7rmW6gb
 OwIIXTDYkeJZBIyh4RZ1fX0HCg==
X-Google-Smtp-Source: ABdhPJw6NKyQlM4kooKTBPKRrF+2YxBrMmlRUoDFIuOrU0Oa7HnOhiNFeW3EcDZ1pSOeMms4CpZIuw==
X-Received: by 2002:a17:90b:243:: with SMTP id
 fz3mr7470339pjb.17.1594776248812; 
 Tue, 14 Jul 2020 18:24:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j13sm263522pjz.8.2020.07.14.18.24.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 18:24:07 -0700 (PDT)
Date: Tue, 14 Jul 2020 18:24:07 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 14/75] x86/boot/compressed/64: Add page-fault handler
Message-ID: <202007141824.C00ADEDC0E@keescook>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-15-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714120917.11253-15-joro@8bytes.org>
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

On Tue, Jul 14, 2020 at 02:08:16PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Install a page-fault handler to add an identity mapping to addresses
> not yet mapped. Also do some checking whether the error code is sane.
> 
> This makes non SEV-ES machines use the exception handling
> infrastructure in the pre-decompressions boot code too, making it less
> likely to break in the future.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
