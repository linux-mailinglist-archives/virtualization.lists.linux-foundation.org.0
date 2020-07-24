Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B6622CC79
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 19:43:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A9EA3888FA;
	Fri, 24 Jul 2020 17:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zK5FKrjyDXL1; Fri, 24 Jul 2020 17:43:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3667B88828;
	Fri, 24 Jul 2020 17:43:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BD74C004C;
	Fri, 24 Jul 2020 17:43:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0A8EC004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BE9F385F8F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RKttrnyRAAO
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:43:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 375D285F8D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:43:52 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t6so5690101pgq.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aaWhQPcSW3bE7rs+REjPzCquXYXIKucEYvw8vc6PND4=;
 b=GhnZGzFM9H5MZ1G8rKO9LRqg8IW3cO1w1wH/BXcQWPilam/lAlnkxGLmZrE9vV4u52
 K4DmyhZRZKHcPv0GEdH0K9KyLtYBYiIg8Y7BKPfji1nPew2uVmw2Cu0KJWgn0+QrhCy6
 J33pUtSnzj+iojGpXI+KpUUcr8S8iTr9Qn8UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aaWhQPcSW3bE7rs+REjPzCquXYXIKucEYvw8vc6PND4=;
 b=oUDqEVDUsk0YhaO5yXMUvID9V0JoCCmzuOfDbTqtolEk24fo2X5UXlvKC1X09xnfo/
 eB4n2ATFnvQaolWyzCennDOA6is1np+D7ctOA865HVZdJKpu9A2Q45GDUI+qTp36YShs
 yJTVOba8wI6cgHMe3SP79ouX8w5MGh4BnBO41uiLHWHOKi7Xe2GRhmUzsesQbwYI2fsz
 f+WtaDssf93sZuiahtHBFB8+fX0cE/EciVqjYxlDfJD5wE72Z7QX9nZ1tPNNqY02dMco
 Z6OvOkWIzQ46dglIeOm+q3UC8mfvkohgW6t/oLsntJZSZWwQ66iihNkzzuJNEVISYGJB
 o5xQ==
X-Gm-Message-State: AOAM533LirOw7LOl9b8yzi2vYt21TQbwnPC/N0QliOKEMYPHJjprCUjl
 Fw3SroDspzJlkjVZg+U1XkzEBw==
X-Google-Smtp-Source: ABdhPJxm1pOTytr68wKlbjbawG7twhZ21XJYJ4ElyB1DPdJJWPc/wanYtwrYMS+M80MURBbJFVeEdw==
X-Received: by 2002:aa7:8096:: with SMTP id v22mr10436021pff.132.1595612631874; 
 Fri, 24 Jul 2020 10:43:51 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o136sm6832398pfg.24.2020.07.24.10.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 10:43:51 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:43:50 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v5 11/75] x86/boot/compressed/64: Disable red-zone usage
Message-ID: <202007241043.654ABB2@keescook>
References: <20200724160336.5435-1-joro@8bytes.org>
 <20200724160336.5435-12-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724160336.5435-12-joro@8bytes.org>
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

On Fri, Jul 24, 2020 at 06:02:32PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The x86-64 ABI defines a red-zone on the stack:
> 
>   The 128-byte area beyond the location pointed to by %rsp is considered
>   to be reserved and shall not be modified by signal or interrupt
>   handlers. Therefore, functions may use this area for temporary data
>   that is not needed across function calls. In particular, leaf
>   functions may use this area for their entire stack frame, rather than
>   adjusting the stack pointer in the prologue and epilogue. This area is
>   known as the red zone.
> 
> This is not compatible with exception handling, because the IRET frame
> written by the hardware at the stack pointer and the functions to handle
> the exception will overwrite the temporary variables of the interrupted
> function, causing undefined behavior. So disable red-zones for the
> pre-decompression boot code.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
