Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCDD1F1993
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 15:01:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2DAC485FB2;
	Mon,  8 Jun 2020 13:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gwcz2lneSHLh; Mon,  8 Jun 2020 13:01:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 39BFC85F8B;
	Mon,  8 Jun 2020 13:01:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13FABC016F;
	Mon,  8 Jun 2020 13:01:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8388CC016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 718D287BA6
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HkhA0tNCEsQ2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:01:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2B2B7822E0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591621298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N4tYRK/0WF4gJ3sPDYLn/EAB8Y9lZ28vccHh6mfdyZY=;
 b=XcI6BOyXj02AmM5OUWDstZj1DK6q1Xl1eG6CAFpCINPOaQsdo+JzkQ1n9KG7w6RE4h+PrH
 QUcea3AHZvfPsif91Tk6Fh3bn7INzdxWG9rLiVA274eWZoVZeQ57CIyScogCeKQk6hN2l1
 1jp4RsJSA8q63AnOE/fMDdgtEavEJog=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-cYiTnKUhN1q2EerKGJJjjA-1; Mon, 08 Jun 2020 09:01:29 -0400
X-MC-Unique: cYiTnKUhN1q2EerKGJJjjA-1
Received: by mail-wr1-f71.google.com with SMTP id w4so7145090wrl.13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 06:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N4tYRK/0WF4gJ3sPDYLn/EAB8Y9lZ28vccHh6mfdyZY=;
 b=EpDiNrDZXDT2zzh2Z0RgT7EElnlxrNT2DY0asHGyIcU5D6QHSKw7MHspacQiafQfpT
 gnc1FwEd49jv3NC5YoMRozRMkhvwKqTymwSl8auAHVhr1ib53BDyP3QdDshdPeKRd7W4
 hpChLvS4ZqLqvDL4Fx/AFgGF6zNCO2Y32y7gQaRferdEPqVi/b/fhs9VbWrHAl63t1DT
 /WQ1jA6ZBoovdcIpaPGVyFubsMruEzG+27nBCKpcSSWw1GPzyJ2+vFZBKj5ChPgfEqfO
 AC5V5P6npbY39y0ZtVo6z0sGg4Caq/JkznDq+zlQvU95eJdPLSAONmutQ6J0FveoCDpz
 mvrA==
X-Gm-Message-State: AOAM530eutIeMpfUa3HD9HHAlvAHdXBpmxbegaj8I/QIFRELM8SIUfKA
 uC00fFRbqjr+RtkcNFBUNHeHumy/mQuhDRfeeWRMa2AZzOc/lpsP+2y4FPpFTLMDDKhMW6GUsv+
 0gmmw561Dscf4v/w8yvDtZAGDHZlnHVZ90nu72XVW+A==
X-Received: by 2002:adf:d851:: with SMTP id k17mr23165017wrl.30.1591621288296; 
 Mon, 08 Jun 2020 06:01:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+ZpeCIIHsXHsXp7F2is1vc7M7N6GxGrFprOEl+lRsTOD0+vtXz9a5XQCm3jC3ps0vzgeTJg==
X-Received: by 2002:adf:d851:: with SMTP id k17mr23164991wrl.30.1591621288062; 
 Mon, 08 Jun 2020 06:01:28 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 z25sm22048079wmf.10.2020.06.08.06.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 06:01:27 -0700 (PDT)
Date: Mon, 8 Jun 2020 09:01:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
Message-ID: <20200608090010-mutt-send-email-mst@kernel.org>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200604151917-mutt-send-email-mst@kernel.org>
 <20200605063435.GA32302@ubuntu> <20200608073715.GA10562@ubuntu>
 <20200608091100.GC10562@ubuntu>
 <20200608051358-mutt-send-email-mst@kernel.org>
 <20200608101526.GD10562@ubuntu>
MIME-Version: 1.0
In-Reply-To: <20200608101526.GD10562@ubuntu>
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

On Mon, Jun 08, 2020 at 12:15:27PM +0200, Guennadi Liakhovetski wrote:
> On Mon, Jun 08, 2020 at 05:19:06AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Jun 08, 2020 at 11:11:00AM +0200, Guennadi Liakhovetski wrote:
> > > Update: I looked through VirtIO 1.0 and 1.1 specs, data format their, 
> > > including byte order, is defined on a per-device type basis. RPMsg is 
> > > indeed included in the spec as device type 7, but that's the only 
> > > mention of it in both versions. It seems RPMsg over VirtIO isn't 
> > > standardised yet.
> > 
> > Yes. And it would be very good to have some standartization before we
> > keep adding things. For example without any spec if host code breaks
> > with some guests, how do we know which side should be fixed?
> > 
> > > Also it looks like newer interface definitions 
> > > specify using "guest native endianness" for Virtual Queue data.
> > 
> > They really don't or shouldn't. That's limited to legacy chapters.
> > Some definitions could have slipped through but it's not
> > the norm. I just quickly looked through the 1.1 spec and could
> > not find any instances that specify "guest native endianness"
> > but feel free to point them out to me.
> 
> Oh, there you go. No, sorry, my fault, it's the other way round: "guest 
> native" is for legacy and LE is for current / v1.0 and up.
> 
> > > So 
> > > I think the same should be done for RPMsg instead of enforcing LE?
> > 
> > That makes hardware implementations as well as any cross-endian
> > hypervisors tricky.
> 
> Yes, LE it is then. And we need to add some text to the spec.
> 
> In theory there could be a backward compatibility issue - in case someone 
> was already using virtio_rpmsg_bus.c in BE mode, but I very much doubt 
> that...
> 
> Thanks
> Guennadi

It's probably easiest to use virtio wrappers and then we don't need to
worry about it.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
