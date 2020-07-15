Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB382201C2
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 03:24:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DFDCE87813;
	Wed, 15 Jul 2020 01:24:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lld0N4yEbe+D; Wed, 15 Jul 2020 01:24:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 41FBF87D1A;
	Wed, 15 Jul 2020 01:24:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BB15C0733;
	Wed, 15 Jul 2020 01:24:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7AD53C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5A03A204EF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jGLk3stxtBPh
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:24:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 66B2F204E1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:24:22 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id s189so859361pgc.13
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 18:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=disvEr8QTdkdT/FiP6nWZpfKiZAj+1GxhY8j6L4+VsQ=;
 b=QlGUunqmMzd7BXyHpekbCEW2V6nSjcB7yoyoPGH4TzD3d5B8mTW/71ZE2cJL8mK51k
 71ARRXSzT77AumtXxSrdaGYuwgbX2UQGZA8vfQJjrakWMO6AYGjVROqvp8NejS2m9Z2A
 7IYT8IbO38FLfB1a/Y4tOBuCZnK/Z5sSj09mI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=disvEr8QTdkdT/FiP6nWZpfKiZAj+1GxhY8j6L4+VsQ=;
 b=ToQQKK3aM1xkVlTVzlK8G3HnUTFlx1Ul2FZltrCJrxn5PXA82P1UOtAzETq3LyYovF
 ZPDg9LTt76/E9OP589fETtZjuuzHDoQwrscvaE7CDeKatIhK1zfNJ79b3I1DpeuNKu+n
 CA9ULbkj0z+rV69fDkDa0x6G9hnT/N1tf5Af8Z32L/MKDKW4Po7ZLXNNmjGZIAQ5O2I7
 88zIPciw9aaBWVX3/8kFOFaUBUpHQ7IItfQhuphNONJiQxUxKIxg+lSRIMNeKP/gTI37
 EqZ/i5FBhfKATDcyRJAnht+rSiawu++q+2P8YGJu3zQ/IDdGz0nFlH5kYEHjJ+EiFyrT
 aJVw==
X-Gm-Message-State: AOAM531bq3Hn+FU+/9puD2X8QnkiKvZwAzyjuddDDZ8Y3vaiAP92t2+E
 Kbp5p6NVeK/aQmVVGXhMglXbeQ==
X-Google-Smtp-Source: ABdhPJweUW+32ofnpX4MJsObP6q2/5f9TZOLrNQ+l84Tm/hPhwj19hU1a21zbXROqArF2N1b8PwEGw==
X-Received: by 2002:a05:6a00:15c8:: with SMTP id
 o8mr6820199pfu.286.1594776261955; 
 Tue, 14 Jul 2020 18:24:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y19sm335301pfc.135.2020.07.14.18.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 18:24:21 -0700 (PDT)
Date: Tue, 14 Jul 2020 18:24:20 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 16/75] x86/boot/compressed/64: Don't pre-map memory in
 KASLR code
Message-ID: <202007141824.6D5B3BE7@keescook>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-17-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714120917.11253-17-joro@8bytes.org>
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

On Tue, Jul 14, 2020 at 02:08:18PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> With the page-fault handler in place the identity mapping can be built
> on-demand. So remove the code which manually creates the mappings and
> unexport/remove the functions used for it.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
