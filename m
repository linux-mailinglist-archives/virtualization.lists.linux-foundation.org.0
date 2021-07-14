Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E56FB3C7C79
	for <lists.virtualization@lfdr.de>; Wed, 14 Jul 2021 05:11:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 799EE60685;
	Wed, 14 Jul 2021 03:11:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hk1p1zok-vJV; Wed, 14 Jul 2021 03:11:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4F14B60724;
	Wed, 14 Jul 2021 03:11:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C978CC001F;
	Wed, 14 Jul 2021 03:11:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6F43C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 03:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 94AE6406B2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 03:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVvKGQDbX47g
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 03:11:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5991406AD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 03:11:27 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id s18so898305pgq.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 20:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=y32N12/p7rYvyE6mcJmofWmxNn37x1C8lHiGzfpcDok=;
 b=DeFMaEcPh/x9l9lVtTPLvhlA8gtRSZKF6n9B8YlvECOQWt920NwOeKZcFbhCVZoUbu
 lpXJvKbeKE3FHE94ersL1EM7AxkF+agXm/RYTVZ3wpoaj1NGGcUvwe5ih9VzB/gDaCC8
 Vo/Bxa5TexycaW9MF4AAqQSuS3OK+kbiArbEjnRUj87pACa6crdatSWXF0wEH/lc1pGM
 RI8D6qjtm4AIxpLdGpuOhO/lamfpuDFeB384HyrNr6lN0MSaSGzMVpH1+GdJAeocoOiR
 1WulySQeY8iGHeB+YeCQzrW1ckwAQef51iCvDwgUWnIivJiaiNpdlwKODdsMSwxPbnPf
 J1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=y32N12/p7rYvyE6mcJmofWmxNn37x1C8lHiGzfpcDok=;
 b=jjGsJVMyrUJUgVBVzD0dobjh9q2BTnWDa5Lr/ZG4jsVwH+s3PbGjg2o2oPzVjcQyPK
 PJwjFGD3PeUifrUZLHKC4YVxVxCYoBoxWb2hUE6FIqeMYkkjRsEFmWyzZC2qLkuFoIJ0
 eqtUaLZ9CeQLiHt/VdRBqzmd8XosdqXlQ1JtdXfN6vS40I0ciESkRAwOq0AyKg/kAu44
 MMIcvdCF9tmVWuGPtGmZQBHVm5lEe4kN2LU4jdugVlC8m3varJIceaP5Va6Cfx9sNtc1
 +UGwF4VMn8sYP6Sa3Z5VaPocaHszEqjpChhyOTo6zst5bnbCt3gDmry3mK8h+h0+uPnC
 4yrA==
X-Gm-Message-State: AOAM531wcVMvKTo1ZrXqzyMK9P34KndPDrwnDfQ5QQlwxlTN/SO8JlzC
 BeOAaSIvsWwfAg4HaFFg6Iuuxw==
X-Google-Smtp-Source: ABdhPJxMZ89BXc4PFH+vkrTJipAkgntgGpFsQ67Ki7NzSqG6NFzmhrCIoGs+gil4b/9GdxS1x1aiQQ==
X-Received: by 2002:a05:6a00:214a:b029:323:3c6e:a24a with SMTP id
 o10-20020a056a00214ab02903233c6ea24amr7865235pfk.4.1626232287003; 
 Tue, 13 Jul 2021 20:11:27 -0700 (PDT)
Received: from localhost ([106.201.108.2])
 by smtp.gmail.com with ESMTPSA id u9sm4151244pjm.34.2021.07.13.20.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 20:11:26 -0700 (PDT)
Date: Wed, 14 Jul 2021 08:41:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 2/5] virtio_mmio: Bind virtio device to device-tree node
Message-ID: <20210714031124.ubbd2fy4omyt7pez@vireshk-i7>
References: <cover.1626173013.git.viresh.kumar@linaro.org>
 <26ba6941fa01eee88c99ecdd611d235c22bd6e3c.1626173013.git.viresh.kumar@linaro.org>
 <CAK8P3a3Sf6CaPKTKEodX_=hGxwoEXiD=UoNOtX6kPOeA9GrjTw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3Sf6CaPKTKEodX_=hGxwoEXiD=UoNOtX6kPOeA9GrjTw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, DTML <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bill Mills <bill.mills@linaro.org>
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

On 13-07-21, 14:26, Arnd Bergmann wrote:
> On Tue, Jul 13, 2021 at 12:51 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Bind the virtio device with its device protocol's sub-node. This will
> > help users of the virtio device to mention their dependencies on the
> > device in the DT file itself. Like GPIO pin users can use the phandle of
> > the device node, or the node may contain more subnodes to add i2c or spi
> > eeproms and other users.
> >
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  drivers/virtio/virtio_mmio.c | 44 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> 
> Hi Viresh,
> 
> I don't see anything in this patch that is specific to virtio-mmio, as
> opposed to
> virtio-pci. It would be better to move this into the virtio core code so it can
> be called independently of the transport that is used for virtio.
> 
> The PCI code has similar code that will set vdev->dev.parent->of_node
> for a virtio-pci device, as long as that node is present.

Sure.
-- 
viresh
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
