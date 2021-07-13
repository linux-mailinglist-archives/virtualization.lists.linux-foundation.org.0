Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F93C7309
	for <lists.virtualization@lfdr.de>; Tue, 13 Jul 2021 17:19:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF14760A82;
	Tue, 13 Jul 2021 15:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0ZW4TPi3x3GK; Tue, 13 Jul 2021 15:19:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 74B9C60A8E;
	Tue, 13 Jul 2021 15:19:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00F5FC0022;
	Tue, 13 Jul 2021 15:19:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CDD3C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 15:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BADB60AA1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 15:19:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fEpdK_Puudct
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 15:19:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7633B60A82
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 15:19:20 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 i16-20020a17090acf90b02901736d9d2218so2333215pju.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xGIQduPCYxV/aV0Im0h8RYp+cXt3nip3dY+ixFjG0D4=;
 b=TcfsG1prt2Xidr8tuUjPWsPhlRzTO3DKhno3TFVuwtzY0fb1xG+Fc3/m8YIRlCuiVf
 oKVuLfYy5WNx1P00HB39kWvNz6MRdodUsCmfs3KY3Oshys5KW7VYr4LKqEqSt8g2dRLz
 2k2gCvZ1SbwdjahCGjwcz2r22XKwG+TLbvbRDNAiJv9iyBZ4Z7EQLTMoeOXOWqqiefGu
 h8Gidj4xog9mjT8MjuLFZQ3O6aJZKjQDc3qsRiiEWlsSdhwNmUkM+vhgplVoixMCZcuj
 ukaXAZemTefe3j49itOLtTT7SvSi8NdSw1n61/P+wT3CrRvOw2wEe0mF1OsTi71AdzA+
 u9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xGIQduPCYxV/aV0Im0h8RYp+cXt3nip3dY+ixFjG0D4=;
 b=Nkzzwa3yBGTvgfj6Z0i2JWza0xFtBy9ccqTaYX47nvPyGoagcxA+ivAB8m9acd6JLH
 d5+rYSdGQGNdX2oLN98xPMgap71XoZ0TyZwGJnWuOjOytZOc2cEanCIJqNki/HeXKAnt
 rj2rtZFFei8rhUgvux8sugja07kHwlGJpkhIN17K9+pUVx/1/Y//Sa2ELIPu7QHJNHtX
 bdlUNnx6GlWjjjaoVFRGOavJoD9QxmBPUiKYbaXhij0NIMhcf0/Th9EaGWwe/2O2wk1c
 5J4mqGKS4309iU3+7xZxYl3czxA/w/vevrr+xNbu63xZopNM/DxahwHzdyDYGxWOs6b6
 WRZw==
X-Gm-Message-State: AOAM5332xq6RLX00VOOkJ/mtn/4Iy7sUF7h8C/4D30sRpd4dm5VDPeNH
 uJQmm++1AC/6n5SP7tGkMRJlfA==
X-Google-Smtp-Source: ABdhPJxbLam7vtpNtCrczB072jPUmk6y+dzP8PaT041Mn/LNIJ4bURMAkxfbGDobFRrrCcwzsL94/Q==
X-Received: by 2002:a17:902:6b42:b029:11d:a147:bb7b with SMTP id
 g2-20020a1709026b42b029011da147bb7bmr4067789plt.9.1626189559780; 
 Tue, 13 Jul 2021 08:19:19 -0700 (PDT)
Received: from localhost ([106.201.108.2])
 by smtp.gmail.com with ESMTPSA id n6sm14172937pgb.60.2021.07.13.08.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 08:19:19 -0700 (PDT)
Date: Tue, 13 Jul 2021 20:49:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: virtio: mmio: Add support for device
 subnode
Message-ID: <20210713151917.zouwfckidnjxvohn@vireshk-i7>
References: <cover.1626173013.git.viresh.kumar@linaro.org>
 <aa4bf68fdd13b885a6dc1b98f88834916d51d97d.1626173013.git.viresh.kumar@linaro.org>
 <CAL_Jsq+SiE+ciZfASHKUfLU1YMPfB43YmSciT_+gQHvL99_wUA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+SiE+ciZfASHKUfLU1YMPfB43YmSciT_+gQHvL99_wUA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Cc: Arnd Bergmann <arnd@kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
 <virtualization@lists.linux-foundation.org>, devicetree@vger.kernel.org,
 Bill Mills <bill.mills@linaro.org>
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

On 13-07-21, 08:43, Rob Herring wrote:
> On Tue, Jul 13, 2021 at 4:50 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Allow virtio,mmio nodes to contain device specific subnodes. Since each
> > virtio,mmio node can represent a single virtio device, each virtio node
> > is allowed to contain a maximum of one device specific subnode.
> 
> Doesn't sound like we need 2 nodes here. Just add I2C devices as child
> nodes. You could add a more specific compatible string, but the
> protocol is discoverable, so that shouldn't be necessary.

I am not sure if it will be a problem, but you can clarify it better.

The parent node (virtio,mmio) is used to create a platform device,
virtio-mmio, (and so assigned as its of_node) and we create the
virtio-device from probe() of this virtio-mmio device.

Is it going to be a problem if two devices in kernel use the same
of_node ? Are there cases where we would need to get the device
pointer from the of_node ? Then we will have two here.

> BTW, what's the usecase for these protocols? A standard interface to
> firmware controlled I2C, GPIO, etc.?

Right now we are looking to control devices in the host machine from
guests. That's what Linaro's project stratos is doing. There are other
people who want to use this for other kind of remote control stuff,
maybe from firmware.

> > diff --git a/include/dt-bindings/virtio/virtio_ids.h b/include/dt-bindings/virtio/virtio_ids.h
> > new file mode 120000
> > index 000000000000..6e59ba332216
> > --- /dev/null
> > +++ b/include/dt-bindings/virtio/virtio_ids.h
> > @@ -0,0 +1 @@
> > +../../uapi/linux/virtio_ids.h
> 
> This will break the devicetree-rebasing tree I think. DT files
> shouldn't reference kernel files.

We already do this for linux-event-codes.h and so I thought it is the
right way of doing it :)

Else we can create a new copy, which will be a mess, or use hardcoded
values.

-- 
viresh
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
