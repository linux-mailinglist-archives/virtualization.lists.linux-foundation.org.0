Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7D42201B9
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 03:23:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5BC9120486;
	Wed, 15 Jul 2020 01:23:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wssydgNVgCqv; Wed, 15 Jul 2020 01:23:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3AFDF2041F;
	Wed, 15 Jul 2020 01:23:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D588C0733;
	Wed, 15 Jul 2020 01:23:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0ABC4C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 071E989D93
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:23:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EpnNzAqWqQrA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:23:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7AE4489D24
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 01:23:16 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id g67so863352pgc.8
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 18:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NT375/NWnBuLf4KzmogX9uCvmnJa241H/PijGYCo0Rk=;
 b=bimL89L0BNwd4ir3o2j2V/AyCZ2jVBpqFkU8fi/kDsbmwoDWfcozJeb3xUXgm++f9+
 1U8Y1/W2AS591JgD3TETxDCp/+qzMH2RffI2AGu37PYQLqP9cI6PXEVdUuxRX36GauNw
 dKzr1hUEyzapgzl8H0hVFH+9sUvWDXwzCjRLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NT375/NWnBuLf4KzmogX9uCvmnJa241H/PijGYCo0Rk=;
 b=jk4S+TM6AFjCnP2U1fyDuXBNGzi+OlmMR0PXihbTy0p+FrgQSr7pj4EMVkg3g+yGAJ
 agRuKhGsIWW77eRfd+y6x1oUI65K39Q/M0YdzBMfjUEzcR2j8UplOCDpFiV/P0kYoAVy
 P6j3WiWVyLYozv+K+XVIRIoTYUGo9Cj/bGLfO7KJ0w+MAaUjCaLHYTYeL8p+tChmLtBH
 yM6C0GPisH9Oc1CxmdftrD0546rmH8qUbuCuDOVXhwEstVOk2mf/19PHACL7eGcgZM19
 ZLpDfU5Ib1WCN/tohV3LXaqnHRIrAGPMKPoZM0pyQIA+f19OgRaqYWl9cW1mDsFRmjOs
 nJDw==
X-Gm-Message-State: AOAM531M1ckOQiaKHaJBpWxxsIB2Gr5YZuBWezmfM8jloyiX0I+y54H2
 BBztE61JzkIiN9tggvKDVWzMzw==
X-Google-Smtp-Source: ABdhPJzfbFkAdUV1tVZNSCYI/nTLerjov6WaHg2IDFRE3YJozMZNUHsxrGh7aJib+qaIcupcJ1NajA==
X-Received: by 2002:a63:405:: with SMTP id 5mr5473617pge.449.1594776196084;
 Tue, 14 Jul 2020 18:23:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d4sm306378pgf.9.2020.07.14.18.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 18:23:15 -0700 (PDT)
Date: Tue, 14 Jul 2020 18:23:14 -0700
From: Kees Cook <keescook@chromium.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 13/75] x86/boot/compressed/64: Rename kaslr_64.c to
 ident_map_64.c
Message-ID: <202007141823.65F31DE0@keescook>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-14-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200714120917.11253-14-joro@8bytes.org>
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

On Tue, Jul 14, 2020 at 02:08:15PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The file contains only code related to identity mapped page-tables.
> Rename the file and compile it always in.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
