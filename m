Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE73360BF0
	for <lists.virtualization@lfdr.de>; Thu, 15 Apr 2021 16:36:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C3884021B;
	Thu, 15 Apr 2021 14:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WvG3FTTVLlkh; Thu, 15 Apr 2021 14:36:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id C27D540230;
	Thu, 15 Apr 2021 14:36:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63A7CC000A;
	Thu, 15 Apr 2021 14:36:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB006C000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 14:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA6A840230
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 14:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1wuTts_jYsq
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 14:36:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 383EF4021B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 14:36:39 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id w3so37256783ejc.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 07:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mjhKqmO4P/HOjUJ1FPn/2ppNQrINwg9izlySqB9JB+o=;
 b=dQZZhJUIg9fPycLxp1hIWYbqTlefJ9fS+5+3rx52g5lZ7R7l35A2B6Jk8Zv1ifQtl1
 FbvQhhMy++oWabaMTxmc3+n7aE2dKX/HhYmxsFwR3ACD/4oXzdGcRmTX7AtZDBI68+XL
 GiZiY7hJuSNwF1xthc6mUuIUt65fEc4YW9S+PFkFCB5OGH31pNIO8a8gPjxAp6ok3M0z
 lb02YlOr9jG1ltSD9X9/TY4ZKNuJnSotaJPn18OAEHFWufO9HQk5HOkecplCbRoUmwzo
 39EWdXnowOPmqd4LXuQEIzd2Sj5Cbr1g5DrpouiwNWVbTLHT/BTs5ZQnehxDa+TAtlCn
 VnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mjhKqmO4P/HOjUJ1FPn/2ppNQrINwg9izlySqB9JB+o=;
 b=apKzN6+oohvrSkRiArKJ0g7mj1kQkSYsBG4VQMO3FfjuqHZYojkadtaqNVI2AnRynU
 a9Tio0lGCJSNVsR1RL+q4mfxf91LMR/WLjpi0gHvOOGQkejo0eghwTOYv+JbIxlH2voC
 TOwuidIoG99IcGzRaQ1iUvEifSyEc2a+qUaNWca4Zi2/Zm2Vuiik/nYshFN/uh0VfLov
 LMXkF6GaWCzNPgKu/ulqrlshnEej1XqfKurxYFpHxG20dVuMEGcn7TPSV8GNsEOuLp80
 rJBSl+0bdbZ1Mj+a4HDiP4j574IjxqYu2x3AXpzPDlQbqv+0WO4FaTK39UrTx2DmPkpT
 4Pxg==
X-Gm-Message-State: AOAM533En0VgOZBLbpLmZyyAhxwaswzD2T4pJa5YX0cfYTmzDfYDn69n
 TrpHmMT6NBooQXVG8TkKMXxvTQ==
X-Google-Smtp-Source: ABdhPJxT42RtxEVSUyx6KmXpl8AEmphR/mLq1GM6Y9HSFmPvxfBq2sTK8w7eGMSiQrfyfZIiwQtvKQ==
X-Received: by 2002:a17:907:20f2:: with SMTP id
 rh18mr3764125ejb.466.1618497397471; 
 Thu, 15 Apr 2021 07:36:37 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id g20sm2776358edu.91.2021.04.15.07.36.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 07:36:37 -0700 (PDT)
Date: Thu, 15 Apr 2021 16:36:17 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH 1/3] ACPICA: iASL: Add definitions for the VIOT table
Message-ID: <YHhPYYXx/gTsx52x@myrica>
References: <20210316191652.3401335-1-jean-philippe@linaro.org>
 <20210316191652.3401335-2-jean-philippe@linaro.org>
 <83d8f573-0a96-5869-2c22-249bf2db7399@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83d8f573-0a96-5869-2c22-249bf2db7399@redhat.com>
Cc: lorenzo.pieralisi@arm.com, mst@redhat.com, robin.murphy@arm.com,
 joro@8bytes.org, rjw@rjwysocki.net, virtualization@lists.linux-foundation.org,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, will@kernel.org, lenb@kernel.org
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

On Thu, Mar 18, 2021 at 06:52:44PM +0100, Auger Eric wrote:
> Besides
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks, though this patch comes from ACPICA and has now been merged with
the other ACPICA updates:
https://lore.kernel.org/linux-acpi/20210406213028.718796-1-erik.kaneda@intel.com/

Thanks,
Jean
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
