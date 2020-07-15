Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E2E2201C0
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 03:23:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 338E189807;
	Wed, 15 Jul 2020 01:23:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z4MIeBqrDoTl; Wed, 15 Jul 2020 01:23:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B31ED8A192;
	Wed, 15 Jul 2020 01:23:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9ADEBC0733;
	Wed, 15 Jul 2020 01:23:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D42AC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F062088261
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W71vXyzFws1L
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:23:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7A5F987FB9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:23:49 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id p3so877863pgh.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 18:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AtJMt5D7K9C8ql3zYlKfD8mfXyjKfGo9YIHofl3GNr8=;
 b=i6mXzKcIDfBhhNQRvvLg/C5UGIuMlqAh1ph4H7eqkHJDr7PuMbMBuSDLs83TP38yNB
 bTsbdAYiN8TVCvUTf3i2k44uwugHJxge/2LYPfWuuLuZ5XRPEeLUIzXPA7TaZAK1f0EG
 p+aeuoS5JQmDj4VQ5zoywN6JsJUFdTahr99K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AtJMt5D7K9C8ql3zYlKfD8mfXyjKfGo9YIHofl3GNr8=;
 b=Y98fjiK/9xBoa4aTqxJ1/4/Mp9IPBcGWdSjtvkELGkQctjLkX5apMo+u7B+FlEXmZ4
 jeNMrqXJ0/QURqIuAIQLSd/4L7vsBmkg32OO3xJHKS04ZBHGGMxSm7UdKjuAeT1RWmEp
 U7WPNAMbW0f00UvD3eecrxmvyZrvXO/+M3IsTB/BYnpK9UFEVZoOnwHFmiiWowUAOfF7
 gEZC0P9GatwWe8ODJGbJz+prJwxKfpC24On7bAxE2gXmjga/YCNJhbl2dHlP/HWdU3Zp
 9wAGAlV6ZWOoFxvxgts3RwmavJYZjjleFV4WOO/nFj90akbZMWqUBet34nvZXm/K9cTk
 DQvQ==
X-Gm-Message-State: AOAM532gcanNbHcn0bq7vbngkAj5XJnP0LzfI6bfFynYKOnQ9zoyiAT1
 jb6fEcFbHXh45ayVb5p4TvkjPg==
X-Google-Smtp-Source: ABdhPJyIl+WxpdHetqRs0iY1NDJGKOEkmNO3iE3VMFuHcXkxfBCWMMImxc6uFhuMgMteLTrgR+OaPg==
X-Received: by 2002:a05:6a00:2bc:: with SMTP id
 q28mr6683696pfs.250.1594776229062; 
 Tue, 14 Jul 2020 18:23:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m3sm325734pfk.171.2020.07.14.18.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 18:23:48 -0700 (PDT)
Date: Tue, 14 Jul 2020 18:23:47 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 15/75] x86/boot/compressed/64: Always switch to own
 page-table
Message-ID: <202007141823.326D9DC102@keescook>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-16-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714120917.11253-16-joro@8bytes.org>
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

On Tue, Jul 14, 2020 at 02:08:17PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> When booted through startup_64 the kernel keeps running on the EFI
> page-table until the KASLR code sets up its own page-table. Without
> KASLR the pre-decompression boot code never switches off the EFI
> page-table. Change that by unconditionally switching to a kernel
> controlled page-table after relocation.
> 
> This makes sure we can make changes to the mapping when necessary, for
> example map pages unencrypted in SEV and SEV-ES guests.
> 
> Also remove the debug_putstr() calls in initialize_identity_maps()
> because the function now runs before console_init() is called.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
