Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 381A7221573
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 21:49:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DBB3188C69;
	Wed, 15 Jul 2020 19:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id avbMjDV2jUVB; Wed, 15 Jul 2020 19:49:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B51288C59;
	Wed, 15 Jul 2020 19:49:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B178C0733;
	Wed, 15 Jul 2020 19:49:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BAD8C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 19:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0DFAE89D23
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 19:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8shKQeQsj-g
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 19:49:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 79AC589D21
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 19:49:25 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id gc9so3593856pjb.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 12:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yppoieqawtommMNv7F4xEsaylvTK3ZvGj7dcQjgO2TY=;
 b=j2qfngMt1we3l0IhZifI4twKJ3j3kBQ/HIpn7YZ5j2qvGCpY3D4CxXVvbwFlxonJnk
 6FWAS/JQzC3Vr2RY57kmgM9BiR+ZrBL3UMBVX0Dg1AEdjzFvwUMCdolO9hvbOeEsYa6u
 jBGIyYHDqd0rQYUMQHt3Rxit3HX4mUF8GqeNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yppoieqawtommMNv7F4xEsaylvTK3ZvGj7dcQjgO2TY=;
 b=Lq1RjTZHJ+THsDGWCA7qE9wT402x3oG5/ja9izcQRMELVG8JtKXyeAfHomwlgTNhpu
 RXsTunV3sBtJakqmgXY6SgGamQo8EMsRwiNNedRcDU84O7+jFAOgWKAvA9UScYDoB8vC
 7xmbLErtPMZ+be+fwGxOrQhmgtnynCneI7riPfQ1sxWj3ZgGyCnp1cSPOWzN+NpJyXln
 dM/lQih0kBNgRyQCDIPV1SHSyO/NQ7CneYYSU1e49KCyFmh8p5NC4oXMiDdpP/2+kO8Z
 82ptnW3TCkF/hhce00Re5k9OBHshqGmNYadHHkZjEsaJQCX/UXPjc/Ke8RhSM2WPm18n
 3htA==
X-Gm-Message-State: AOAM5320LojTLq/N9Ymb4+7oaDUAlvdZwWhLdYP2mEaF9pYe3AbZGzeM
 b01p6D6Dp0mJqsK8XH5nlWaW8Q==
X-Google-Smtp-Source: ABdhPJxvA58SlKkMWKAljrVfZntLrDAODkXc0OEIDnErZntti/oMHX7TUTMJUyPo0nAVuQc7dj8q2g==
X-Received: by 2002:a17:902:8c91:: with SMTP id
 t17mr825746plo.235.1594842565095; 
 Wed, 15 Jul 2020 12:49:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id g7sm2685716pfh.210.2020.07.15.12.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 12:49:24 -0700 (PDT)
Date: Wed, 15 Jul 2020 12:49:23 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v4 70/75] x86/head/64: Don't call verify_cpu() on
 starting APs
Message-ID: <202007151244.315DCBAE@keescook>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-71-joro@8bytes.org>
 <202007141837.2B93BBD78@keescook> <20200715092638.GJ16200@suse.de>
 <202007150815.A81E879@keescook> <20200715154856.GA24822@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715154856.GA24822@suse.de>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>,
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

On Wed, Jul 15, 2020 at 05:48:56PM +0200, Joerg Roedel wrote:
> It is actually the CPUID instructions that cause #VC exceptions. The
> MSRs that are accessed on AMD processors are not intercepted in the
> hypervisors this code has been tested on, so these will not cause #VC
> exceptions.

Aaah. I see. Thanks for the details there. So ... can you add a bunch
more comments about why/when the new entry path is being used? I really
don't want to accidentally discover some unrelated refactoring down
the road (in months, years, unrelated to SEV, etc) starts to also skip
verify_cpu() on Intel systems. There had been a lot of BIOSes that set
this MSR to disable NX, and I don't want to repeat that pain: Linux must
never start an Intel CPU with that MSR set. :P

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
