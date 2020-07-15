Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CD82201CE
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 03:26:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5DD368A19B;
	Wed, 15 Jul 2020 01:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zx8r+j8meBIx; Wed, 15 Jul 2020 01:26:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D9AB38A192;
	Wed, 15 Jul 2020 01:26:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB498C0733;
	Wed, 15 Jul 2020 01:26:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45B80C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 342778A198
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LIeQr4hZQFFL
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:26:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7D6808A191
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:26:00 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id a14so677805pfi.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 18:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=//8Ju0FArBc4zb01MxBoUcI/VYVDSlzg+BW3vSvSIkE=;
 b=aGa5ZBgHdWlGrdfvyqG//oW9uMRL8c4lif5pE5f9n31J0nGMfTfTLdQH8s0aTTbj5E
 XseYVdFj/m/ggc4SYgZzFFvS4yWNkLyoDsxCgYX3tfj9qjanEQCxrddTm1aZfG0VbwNO
 xgWTY5KoMFbPTRNg4DxovW5nmKheMJSQTsCOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=//8Ju0FArBc4zb01MxBoUcI/VYVDSlzg+BW3vSvSIkE=;
 b=cPsE7MoNzMdfE7IFXywfezR6xV+aD6ovECOMQCEOgqEIUuk3RNlQxCl18h+DYiDLHU
 +ZjqZPpTR67YuS88C5vxC0EGKN2lrHNvdmgdhfjZ4cq9keyj9GjrHw6RVi0V2CgTB2La
 CHcSTzGQugq6ZcQFrL1LzFaFmrNQ2GR/CsL9DycW5FzxW4AAAiGT+tebx2Jm6Kq5uTxE
 BG4vO5ySR8GctwW2dGd4pzvPDFbdXAcoqkOefa81KhkI6pDJMv4XoW2M1mK7WVP4JYTX
 xY5130yZwhtJ7gSPuGjO/tz4vG2Sno8hUcnqwmyRAomvECAuUVI1O9Q5MzZePk0Wym0H
 +z0Q==
X-Gm-Message-State: AOAM531LFf2vy4DXQeB5ip76I8sO6sawd81/YyU1NBH4AcZytzh0zTRp
 RF3S7M4xMNCzTgDiTeqHx0RjIQ==
X-Google-Smtp-Source: ABdhPJzLdhmv/sgESdhBL5NEfWWnipaR1+RTxq1oQwAzUR+7rkRLawIsRncUD/eUpdU7XimBXhr5BQ==
X-Received: by 2002:a63:5004:: with SMTP id e4mr5816911pgb.208.1594776360077; 
 Tue, 14 Jul 2020 18:26:00 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l23sm246555pjy.45.2020.07.14.18.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 18:25:59 -0700 (PDT)
Date: Tue, 14 Jul 2020 18:25:58 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 27/75] x86/idt: Move IDT to data segment
Message-ID: <202007141825.7A90799@keescook>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-28-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714120917.11253-28-joro@8bytes.org>
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

On Tue, Jul 14, 2020 at 02:08:29PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> With SEV-ES, exception handling is needed very early, even before the
> kernel has cleared the bss segment. In order to prevent clearing the
> currently used IDT, move the IDT to the data segment.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
