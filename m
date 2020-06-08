Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5EA1F19AF
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 15:08:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7927686E9E;
	Mon,  8 Jun 2020 13:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZwnBSy3tK5D6; Mon,  8 Jun 2020 13:08:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E44EC86F8A;
	Mon,  8 Jun 2020 13:08:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5E5CC016F;
	Mon,  8 Jun 2020 13:08:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B973C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 58A9B86ECC
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SunOX51aJU-c
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:08:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 33D5386E9E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 13:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591621720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dqBwBX1iWxa0YmZVaEODhc8PGLo2VfdKn86FOfgmR1g=;
 b=RnImqbY2zCdhTc8uG5KaCKBtyA2QUWBP3+0tN1Kf6awKg2MTJG8kx0pUYd+SW0hgDlU7ty
 SELEzOIynYlaY6JAzYUj1VUxfcNrpxjFAbRGZ5hEHizMR3iKc+ugxCND1+y9M2WTeDqylZ
 +iT+6gD1kONPlIqWIkfqRgqYY7Svrbo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-R28iDEwyMW6cLCNiBk_dtg-1; Mon, 08 Jun 2020 09:08:38 -0400
X-MC-Unique: R28iDEwyMW6cLCNiBk_dtg-1
Received: by mail-wr1-f72.google.com with SMTP id j16so7082683wre.22
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 06:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dqBwBX1iWxa0YmZVaEODhc8PGLo2VfdKn86FOfgmR1g=;
 b=erDNg2RVDzxEN+sk9PioKHMml035vyKoKAzFgzSWYKzW+u6AsKWZASWUby/pp1Sk8C
 nCdWFbs2RwUsTXCJKzsCZM++2e+Dl7++Z0bySe+gFAnta+6gn8HAYTrsoJU86JioWekH
 QrAh6yepg21Xc2Bi9/PYSPorfrCT/K40bQgTJ9wNd8OI6TSsP6AYBphbJQtysedswIia
 daIv1vZyIhoOFi6BesyoNJubcFCqmbK+TLakLrK3uhrJ+tGg3Weyi9V4eCtUiYjYsYIF
 Rcp7nff/clDQN/kUnm7oWrMxH3vG9LVs2R4nRrCfgKSnr6ynajC4zM0rJTz+qSX/QQQO
 Hrtw==
X-Gm-Message-State: AOAM530kz1VNYV0DRXdYp12dKyr+PXlmCXBemuyFHfyLSiMu6L2rpVFk
 B+4tT4eKBRurckBK5ZSpHZA45AtstHp75U3ZHAg8pMpFneztzLi6X1EBnYASWxl6dEQYVqg51jk
 3wLKj27bM0KB6q0jSVdQ0WPb7BHZ1UJYFWrPDN3phEA==
X-Received: by 2002:a5d:6789:: with SMTP id v9mr25040811wru.124.1591621716992; 
 Mon, 08 Jun 2020 06:08:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMOU/wtRvJJc/E+tmpBswF5Ul40bkOzM0HliSRv4EENKFeQzLuZVeBr361vAI3C5zdXVwJig==
X-Received: by 2002:a5d:6789:: with SMTP id v9mr25040787wru.124.1591621716746; 
 Mon, 08 Jun 2020 06:08:36 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 b8sm24159773wrs.36.2020.06.08.06.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 06:08:36 -0700 (PDT)
Date: Mon, 8 Jun 2020 09:08:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
Message-ID: <20200608090145-mutt-send-email-mst@kernel.org>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200604151917-mutt-send-email-mst@kernel.org>
 <20200605063435.GA32302@ubuntu> <20200608073715.GA10562@ubuntu>
 <20200608091100.GC10562@ubuntu>
 <20200608051358-mutt-send-email-mst@kernel.org>
 <20200608101526.GD10562@ubuntu> <20200608111637.GE10562@ubuntu>
MIME-Version: 1.0
In-Reply-To: <20200608111637.GE10562@ubuntu>
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

On Mon, Jun 08, 2020 at 01:16:38PM +0200, Guennadi Liakhovetski wrote:
> On Mon, Jun 08, 2020 at 12:15:26PM +0200, Guennadi Liakhovetski wrote:
> > On Mon, Jun 08, 2020 at 05:19:06AM -0400, Michael S. Tsirkin wrote:
> > > On Mon, Jun 08, 2020 at 11:11:00AM +0200, Guennadi Liakhovetski wrote:
> > > > Update: I looked through VirtIO 1.0 and 1.1 specs, data format their, 
> > > > including byte order, is defined on a per-device type basis. RPMsg is 
> > > > indeed included in the spec as device type 7, but that's the only 
> > > > mention of it in both versions. It seems RPMsg over VirtIO isn't 
> > > > standardised yet.
> > > 
> > > Yes. And it would be very good to have some standartization before we
> > > keep adding things. For example without any spec if host code breaks
> > > with some guests, how do we know which side should be fixed?
> > > 
> > > > Also it looks like newer interface definitions 
> > > > specify using "guest native endianness" for Virtual Queue data.
> > > 
> > > They really don't or shouldn't. That's limited to legacy chapters.
> > > Some definitions could have slipped through but it's not
> > > the norm. I just quickly looked through the 1.1 spec and could
> > > not find any instances that specify "guest native endianness"
> > > but feel free to point them out to me.
> > 
> > Oh, there you go. No, sorry, my fault, it's the other way round: "guest 
> > native" is for legacy and LE is for current / v1.0 and up.
> > 
> > > > So 
> > > > I think the same should be done for RPMsg instead of enforcing LE?
> > > 
> > > That makes hardware implementations as well as any cross-endian
> > > hypervisors tricky.
> > 
> > Yes, LE it is then. And we need to add some text to the spec.
> 
> I found the protocol and the message format definition: 
> https://github.com/OpenAMP/open-amp/wiki/RPMsg-Messaging-Protocol#transport-layer---rpmsg 
> Don't know what the best way for referencing it in the VirtIO standard 
> would be: just a link to the source or a quote.
> 
> Thanks
> Guennadi

I wasn't aware of that one, thanks!
OK so that's good.

Ideally we'd have RPMsg Header Definition, RPMsg Channel and RPMsg
Endppint in the spec proper.

This link is informal so can't be copied into spec as is but can be used as a basis.

We'd also need approval from authors for inclusion in the spec,
sent to the TC mailing list.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
