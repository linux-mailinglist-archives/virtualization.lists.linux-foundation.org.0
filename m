Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A427A2FD4DD
	for <lists.virtualization@lfdr.de>; Wed, 20 Jan 2021 17:07:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 42AAC8666D;
	Wed, 20 Jan 2021 16:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fg8PJxqbt4Og; Wed, 20 Jan 2021 16:07:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A816A8658D;
	Wed, 20 Jan 2021 16:07:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D6C3C013A;
	Wed, 20 Jan 2021 16:07:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCA30C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 16:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7E72B20108
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 16:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lZCgKjIKVsSM
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 16:07:36 +0000 (UTC)
X-Greylist: delayed 00:09:25 by SQLgrey-1.7.6
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by silver.osuosl.org (Postfix) with ESMTPS id EC49220000
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 16:07:35 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id b21so17558371edy.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 08:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=odx+DIka95/c6zrkDR8kFE4sUKEXLWcK1XgsQ64ZqzY=;
 b=UMnPQ/JMGjxdP+z21Xc0rMdynZ2F0/J98NfDoBgwtmxhotW2QGV2jdCpP/jnDdF+a9
 t0TDXmlE+faEnS+090/bYRA/KjWHkaodSI/IplZnq1ZLL2b/SaMsRbTa4Cj8p/F4jSVi
 oOeR3NyDb3+wpTLdgaGPmdnNysc00uvxirVYEcFmZiWTNZUTv3NrY+AlNuvS+7Gjelg3
 W+a239Cc+KCibmr3e7lV7xnhShn1E6Qzyk78zvOEmmjdS7m1Z3wsXTckFVACoAM7rN+f
 UuAVI6hYX9K9sVw6pwc5Z7u01qATw6GAws+9iSSXFn81Cdu/CcyTQFibhnW4KDrxc4TG
 +RXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=odx+DIka95/c6zrkDR8kFE4sUKEXLWcK1XgsQ64ZqzY=;
 b=tdd4L9IHuCau38uzrDGTqgcthyNuq+ksZrVLXbY2UDsX7S/LAzeHOKYdslacF7U9Ng
 T7cRfT4xoE1MyugugBMapblcuJJl1W+fFOvEYXycwKEWL0A04Bar8NIcHZvGZXpW+zyU
 YQekWLHmPTF0IrUPUJH2Nphlbt4OvSYbPSl1z9iWhfuzPa0w66JoKikFePOW1tlDIoP8
 LKElA6YDORK/pGK4BowWxPQaUqv/HI8TZaCrCJqX9cez3dsmOUdFMZ+1eUAVslqu/9jF
 Qug04aPoKKUlSiVho5iibCVNMyD6vyIpkGBgiylhpTYpnels5KkaAmr6akHcONm34ry9
 0uRQ==
X-Gm-Message-State: AOAM533RXZliXvZwLx3PTemBUAGWlddDwR+zc697sVDcf8ihA1t8qnXc
 RTzAfsKFPt+Zz2mvLpqqcGGyejIoHwYXKJD5vzY/6w==
X-Google-Smtp-Source: ABdhPJw1NEcdnEbxX+CkQBkpBO6Vc2zgJb1eRfvm75+kgadtVnofZIhH+bMdVnrUYhwCtF+ahQ/2RUr6G06e0f8kpQ8=
X-Received: by 2002:a05:6402:304e:: with SMTP id
 bu14mr7526130edb.60.1611158854493; 
 Wed, 20 Jan 2021 08:07:34 -0800 (PST)
MIME-Version: 1.0
References: <20210120120058.29138-1-wei.liu@kernel.org>
 <20210120120058.29138-4-wei.liu@kernel.org>
In-Reply-To: <20210120120058.29138-4-wei.liu@kernel.org>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 20 Jan 2021 11:06:58 -0500
Message-ID: <CA+CK2bBUSN5N4XYepibbvakKFgkzEWwFN4DUMrufPtDrYBJvDQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] Drivers: hv: vmbus: skip VMBus initialization if
 Linux is root
To: Wei Liu <wei.liu@kernel.org>
Cc: Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Michael Kelley <mikelley@microsoft.com>,
 Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 virtualization@lists.linux-foundation.org,
 Vineeth Pillai <viremana@linux.microsoft.com>
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

On Wed, Jan 20, 2021 at 7:01 AM Wei Liu <wei.liu@kernel.org> wrote:
>
> There is no VMBus and the other infrastructures initialized in
> hv_acpi_init when Linux is running as the root partition.
>
> Signed-off-by: Wei Liu <wei.liu@kernel.org>
> ---
> v3: Return 0 instead of -ENODEV.
> ---
>  drivers/hv/vmbus_drv.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
> index 502f8cd95f6d..ee27b3670a51 100644
> --- a/drivers/hv/vmbus_drv.c
> +++ b/drivers/hv/vmbus_drv.c
> @@ -2620,6 +2620,9 @@ static int __init hv_acpi_init(void)
>         if (!hv_is_hyperv_initialized())
>                 return -ENODEV;
>
> +       if (hv_root_partition)
> +               return 0;
> +

Reviewed-by: Pavel Tatashin <pasha.tatashin@soleen.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
