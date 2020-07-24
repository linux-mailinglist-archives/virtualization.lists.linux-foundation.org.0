Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBB322CCB3
	for <lists.virtualization@lfdr.de>; Fri, 24 Jul 2020 19:57:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB4B088A31;
	Fri, 24 Jul 2020 17:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhIt2YOFdMk7; Fri, 24 Jul 2020 17:57:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3317A8777D;
	Fri, 24 Jul 2020 17:57:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 065C3C004C;
	Fri, 24 Jul 2020 17:57:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C9EB4C004C
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B938788A31
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:57:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Er-fHTHMWbsk
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:57:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2D8678777D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 17:57:39 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id k71so5721158pje.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kMaFwW8t3IfIMVggiKK5OHJuDKp9jaqqEbc7QFoh/rs=;
 b=CJVXb5n6JR5dWMx2tAJLg0bcwhbi4VQqyjo9ptukfmM2mUWjqZH+jR4n9It2TyDcL6
 DImQfQV/+SB3ARDdJ+h56qcR6WkyApTGi8w3+KG7PXrxzaipl3pJotCGKEKeeIXseiao
 kT7/1zeJ2y2o+p3sPye32JbtH4ABoCfClNQCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kMaFwW8t3IfIMVggiKK5OHJuDKp9jaqqEbc7QFoh/rs=;
 b=lSnLH4cO0MtuEodsk5qkqIXpCRWDAv1GTI25DZptzlOdB1QP33pXmrmSSassWKqA7O
 fMC1X0xLsM86+Wx7J76t7gVpAsYQhLRnLb7A3t5+eT+5Y8Nt9Cp1zjJ8PfADD+8dediw
 GPc4VUefUdjIKw+/9fS3lkQgnpKfdmkDJ7UnFkvQXZQGnEdCnLMJjXN6QW5mAYltDWYV
 BGI2YsVTc/GMB6UhMeFVTs/rlIwP5eI6wiC8DRnJA5yWGwf+8dzz+mMC63y3IQGElQoZ
 7IqiceD3lcDVlw4ddlSzU2F2Ln1i1I6ngS8uQuCltiPN6CuAB/jhkKYizajQD8klApQB
 dNeQ==
X-Gm-Message-State: AOAM533ZSS3YtbU/AOSwuT5fzn+xxlkOoBxB6U4UfHbSHZXjRE7TJTn7
 5NBJzmqC5y6oJdbgzBLV/i02Aw==
X-Google-Smtp-Source: ABdhPJwT1ivDifcMkDJuyupKZW8COKgntYhL394BofNxgSA9BgFQyVU125t2d5Ivjc4ONMX5CLywvA==
X-Received: by 2002:a17:90a:ed87:: with SMTP id
 k7mr6699745pjy.31.1595613458750; 
 Fri, 24 Jul 2020 10:57:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id g6sm6950620pfr.129.2020.07.24.10.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 10:57:37 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:57:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v5 70/75] x86/head/64: Don't call verify_cpu() on
 starting APs
Message-ID: <202007241057.2D78C2A41B@keescook>
References: <20200724160336.5435-1-joro@8bytes.org>
 <20200724160336.5435-71-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724160336.5435-71-joro@8bytes.org>
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

On Fri, Jul 24, 2020 at 06:03:31PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The APs are not ready to handle exceptions when verify_cpu() is called
> in secondary_startup_64.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Thanks for updating this! :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
