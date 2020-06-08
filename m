Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CF61F1545
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 11:19:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DA18385D41;
	Mon,  8 Jun 2020 09:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fi8iDN2HPFEe; Mon,  8 Jun 2020 09:19:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6E23485D40;
	Mon,  8 Jun 2020 09:19:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A6D0C016F;
	Mon,  8 Jun 2020 09:19:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B98DC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ED4D685D40
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VVqr1YyQYzOw
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:19:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6BA5685C95
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591607953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kn8BcOVPI4dKLlZEoUFeNJgnO3vX7kKpRZZKwDzWCM4=;
 b=Wy7CDbTjHAQ6foevlgvG+eWmSRZsVDrJJgUgMG0R3TN02zkogcCBVroQSjdU2tCS1Qyv76
 K5HFs5whhcGpUpfYJQVmf6TDIA5iQWu/+u33y/ko2r1GXAwoty3P/kdLa6QBYDC7nzrkt9
 408SRlzuLpCAAnTWcAjoOEuo87j/jMU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-H2cxSRtxOROGLj48erDS4g-1; Mon, 08 Jun 2020 05:19:11 -0400
X-MC-Unique: H2cxSRtxOROGLj48erDS4g-1
Received: by mail-wm1-f72.google.com with SMTP id h25so5163185wmb.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 02:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kn8BcOVPI4dKLlZEoUFeNJgnO3vX7kKpRZZKwDzWCM4=;
 b=JKvJL2iCX/uTGpPy+eQbCy5VhI0qI/TmzF6SqeNcL3TpXIXp3wMLo9r+BO+NesHc5i
 LAZxEpOjXp4OeLpRkpSeLI45i6PyodbjpQ0KzJqgCJV8h2bllXcQ0cTmLn4PXJQl3PDO
 Cf3Xlat77GpmVPgEizgY4VQ74stX/d4tc0TVIiKWfND+ioDX71w2w95X5igBVLH/xDJo
 GeEvojsrsmZ7wwTxArCajQp3qGPJEhnmMV3gQN/lPSkwONRyvRb3Vdd8BfsopxaaHbWb
 Yo+aKfNk8CSPQoSWfgVs2qWxUCLV0bWB4EkAaCJkrhNwgZlt6irzS738MlSwL3oGFUW+
 GJLg==
X-Gm-Message-State: AOAM531SNrBCCysc4oIfA44+k24EJowWKIe025kbDw95ntOlQCGxzPGh
 rH3c13FY9LQF1U1dAxdqFxy4GLRgkjkyOZ/IFUFpU94vdVtoSpPGBqsMnj2u6+z7nAOS30uYx1r
 LsVnDTacLMdCvVWJTai51+axRwyj/wRHm305SPMETxw==
X-Received: by 2002:a1c:4c8:: with SMTP id 191mr15166578wme.14.1591607950357; 
 Mon, 08 Jun 2020 02:19:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysGO90rYrCc3hVq6L5tbawFDDHDFTwffBp9oo0zw0IemSE9gTXzCwg+wtmvYkRO//psgripw==
X-Received: by 2002:a1c:4c8:: with SMTP id 191mr15166561wme.14.1591607950184; 
 Mon, 08 Jun 2020 02:19:10 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 o15sm23050690wrv.48.2020.06.08.02.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:19:09 -0700 (PDT)
Date: Mon, 8 Jun 2020 05:19:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
Message-ID: <20200608051358-mutt-send-email-mst@kernel.org>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200604151917-mutt-send-email-mst@kernel.org>
 <20200605063435.GA32302@ubuntu> <20200608073715.GA10562@ubuntu>
 <20200608091100.GC10562@ubuntu>
MIME-Version: 1.0
In-Reply-To: <20200608091100.GC10562@ubuntu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kvm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 sound-open-firmware@alsa-project.org
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

On Mon, Jun 08, 2020 at 11:11:00AM +0200, Guennadi Liakhovetski wrote:
> Update: I looked through VirtIO 1.0 and 1.1 specs, data format their, 
> including byte order, is defined on a per-device type basis. RPMsg is 
> indeed included in the spec as device type 7, but that's the only 
> mention of it in both versions. It seems RPMsg over VirtIO isn't 
> standardised yet.

Yes. And it would be very good to have some standartization before we
keep adding things. For example without any spec if host code breaks
with some guests, how do we know which side should be fixed?

> Also it looks like newer interface definitions 
> specify using "guest native endianness" for Virtual Queue data.

They really don't or shouldn't. That's limited to legacy chapters.
Some definitions could have slipped through but it's not
the norm. I just quickly looked through the 1.1 spec and could
not find any instances that specify "guest native endianness"
but feel free to point them out to me.

> So 
> I think the same should be done for RPMsg instead of enforcing LE?
> 
> Thanks
> Guennadi

That makes hardware implementations as well as any cross-endian
hypervisors tricky.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
