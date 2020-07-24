Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0158C22CC4E
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 19:40:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2C44287264;
	Fri, 24 Jul 2020 17:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYccU7P2WDd6; Fri, 24 Jul 2020 17:40:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D96D787257;
	Fri, 24 Jul 2020 17:40:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B08A3C004D;
	Fri, 24 Jul 2020 17:40:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22B25C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0CED988D67
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C7dOqr0FSfME
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:40:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6C69988D64
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:40:29 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id t15so5705671pjq.5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 10:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QMsfHaQGQ+0SRHcIqI75rby1zzIeBrnwc+TycCSBhRM=;
 b=UFmzpMf7uzK2lx30P3rhoBpvw5w85/VUsDXt/5ykAeCH/VFrEJEwB9RmNcdbY2LhWz
 FiNtcwq6cYSJDFEy9jc1V2I68Ud1ixnRqGj5AYeAVOuh08EcTn9UXClFjujGlNhJqqyt
 /o0xfCbeW0wGt1skpJ0dBBA+3UPdspZahcnFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QMsfHaQGQ+0SRHcIqI75rby1zzIeBrnwc+TycCSBhRM=;
 b=p+r0A5WbP4PM04onIwDbWt76m5+W8WFOUD1zq/eZsGxTxVoPdFSNj5MFPNFzGE1HmG
 b5RmOx9xej7NoBBX5LxRaUeolCMbDtzl7LCSVxCBk4WkhL608H3s2AROYOLiEOLakMkz
 /eCVIxjnL3HnKZ4fPDbZXB/ih99dZQRlgqBn0P8lGg/9bmccEIGwq8y8iCWauiFWAfak
 U0sSicuoY/u98xuBlSuiadyH6vnSuSK85i1UTQ3biBcsmWAlGgeJcv8KO0O2tpgwhOHY
 s6ZPvr8KLBW4kJNv0PbzdN2vI32GOrq/qD4fG1j92fIaO004cQz3Etp9Sb3JJrJ4iJes
 13jQ==
X-Gm-Message-State: AOAM5319Gme23Srjh/EnUgYJaxjJlSDCEppEhO7/OuEfRfvxwwvr+JLv
 VoePhf4Dmtp+G1oKepSypNOYDg==
X-Google-Smtp-Source: ABdhPJyekeM+nvr+iN70DB8t8eLU5BEdU2IBMUBrLQ9bGL/yN7X161hHc1aZr2MM8o1xGhcfY2+Q3A==
X-Received: by 2002:a17:902:9a0a:: with SMTP id
 v10mr9082983plp.134.1595612429062; 
 Fri, 24 Jul 2020 10:40:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q24sm7188513pfg.34.2020.07.24.10.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 10:40:28 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:40:27 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v5 31/75] x86/head/64: Load GDT after switch to virtual
 addresses
Message-ID: <202007241040.4A0CF961@keescook>
References: <20200724160336.5435-1-joro@8bytes.org>
 <20200724160336.5435-32-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724160336.5435-32-joro@8bytes.org>
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

On Fri, Jul 24, 2020 at 06:02:52PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Load the GDT right after switching to virtual addresses to make sure
> there is a defined GDT for exception handling.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
