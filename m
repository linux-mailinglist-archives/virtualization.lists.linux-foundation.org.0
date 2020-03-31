Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE2A199E26
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 20:38:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 75FF887EAC;
	Tue, 31 Mar 2020 18:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmNopRCgPH+Z; Tue, 31 Mar 2020 18:38:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6235487EAD;
	Tue, 31 Mar 2020 18:38:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53FA2C1D8A;
	Tue, 31 Mar 2020 18:38:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50F9AC07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 18:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3AD5386DE1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 18:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 60xNxVE3ORVX
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 18:38:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2D16786DEF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 18:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585679891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DCBEU8xfWPGRP7T0kzGMhyTHNf5Ar1K3myE5Isk/Yus=;
 b=Fes8OKzj/rtWwDeF7/zE6i0GHbZk6gpNYdW33ULClrom+kc7RnhuzBnCZVMbrdlEFMZWy0
 ogmQrebcFn+Q456+39LT3Mj+tcd9Wp1rVeL+3tWtlFBMGT/DzQKjwfZYoyh99NFCo4tNU/
 M0eeSiLhHjL29OsCUGHZl4NYEAii+4s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-IlSbLNDwORKFMT94fMH-Ig-1; Tue, 31 Mar 2020 14:38:00 -0400
X-MC-Unique: IlSbLNDwORKFMT94fMH-Ig-1
Received: by mail-wm1-f72.google.com with SMTP id u6so1037545wmm.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 11:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DCBEU8xfWPGRP7T0kzGMhyTHNf5Ar1K3myE5Isk/Yus=;
 b=CRZGlzSreVs8BN5woHWJtN+oetF9HGLnPTpaBME3KcBBnas4ulfSaLDZm4xW7/54DR
 gFglzdN3uhCIfMvK7BACajEdLBj0hvNDx8JvqdqQ/MzFcd/go5eRj4FvGb1AbDf26G1Z
 q1QFjddi5IhEs01P3Q2Z8EfaegGAlUAM4VqYSnLmqg8i5t9DKbv7UB9vEPxGynaISVIY
 6Rc2WxKhfveCqtVqn/efiQGVeI+cmk3JwLgt1vA25Dfrq/eIAfUZvGzDaqwaYxRPKDP/
 NR51hdhEoR93mMRdxH4S0cbjkz5YDAuFCU++EbBOxVaSf5XTcqXwJilB6JXbSIpKUqXV
 5aEA==
X-Gm-Message-State: ANhLgQ1gJfHsSW9yMpukAVPv0H/uUsIBkzt23Jm6ov/D7G3/TtLZefAq
 ucITTNtZJYKGG0MyOuJfAZV1emgyEHbU6zHeX6RY70KBO37rPCGvPGOJQqNbKOmOMQcDf3st2lQ
 K6eNaDDN2FJINrI5V2qu2UEruvO6MI44Hy72p2hPOJA==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr21278437wrq.282.1585679879820; 
 Tue, 31 Mar 2020 11:37:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv7BkgR0ghsMi1Xgc6DnC2NK7tqfIaM77t9wkjqEFGZ1NVpf3iEEFN2O7dAkJUYQEvEgprBcw==
X-Received: by 2002:a5d:470b:: with SMTP id y11mr21278415wrq.282.1585679879621; 
 Tue, 31 Mar 2020 11:37:59 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id l17sm28536847wrm.57.2020.03.31.11.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 11:37:58 -0700 (PDT)
Date: Tue, 31 Mar 2020 14:37:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2020-03-30-18-46 uploaded (VDPA + vhost)
Message-ID: <20200331143437-mutt-send-email-mst@kernel.org>
References: <20200331014748.ajL0G62jF%akpm@linux-foundation.org>
 <969cacf1-d420-223d-7cc7-5b1b2405ec2a@infradead.org>
MIME-Version: 1.0
In-Reply-To: <969cacf1-d420-223d-7cc7-5b1b2405ec2a@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: sfr@canb.auug.org.au, mm-commits@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, mhocko@suse.cz, linux-mm@kvack.org,
 broonie@kernel.org, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org
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

On Tue, Mar 31, 2020 at 11:27:54AM -0700, Randy Dunlap wrote:
> On 3/30/20 6:47 PM, akpm@linux-foundation.org wrote:
> > The mm-of-the-moment snapshot 2020-03-30-18-46 has been uploaded to
> > 
> >    http://www.ozlabs.org/~akpm/mmotm/
> > 
> > mmotm-readme.txt says
> > 
> > README for mm-of-the-moment:
> > 
> > http://www.ozlabs.org/~akpm/mmotm/
> > 
> > This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> > more than once a week.
> > 
> > You will need quilt to apply these patches to the latest Linus release (5.x
> > or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> > http://ozlabs.org/~akpm/mmotm/series
> > 
> > The file broken-out.tar.gz contains two datestamp files: .DATE and
> > .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
> > followed by the base kernel version against which this patch series is to
> > be applied.
> > 
> > This tree is partially included in linux-next.  To see which patches are
> > included in linux-next, consult the `series' file.  Only the patches
> > within the #NEXT_PATCHES_START/#NEXT_PATCHES_END markers are included in
> > linux-next.
> > 
> > 
> > A full copy of the full kernel tree with the linux-next and mmotm patches
> > already applied is available through git within an hour of the mmotm
> > release.  Individual mmotm releases are tagged.  The master branch always
> > points to the latest release, so it's constantly rebasing.
> > 
> > 	https://github.com/hnaz/linux-mm
> 
> on i386:
> 
> ld: drivers/vhost/vdpa.o: in function `vhost_vdpa_init':
> vdpa.c:(.init.text+0x52): undefined reference to `__vdpa_register_driver'
> ld: drivers/vhost/vdpa.o: in function `vhost_vdpa_exit':
> vdpa.c:(.exit.text+0x14): undefined reference to `vdpa_unregister_driver'
> 
> 
> 
> drivers/virtio/vdpa/ is not being built. (confusing!)
> 
> CONFIG_VIRTIO=m
> # CONFIG_VIRTIO_MENU is not set
> CONFIG_VDPA=y

Hmm. OK. Can't figure it out. CONFIG_VDPA is set why isn't
drivers/virtio/vdpa/ built?
we have:


obj-$(CONFIG_VDPA) += vdpa/

and under that:

obj-$(CONFIG_VDPA) += vdpa.o


> CONFIG_VDPA_MENU=y
> # CONFIG_VDPA_SIM is not set
> CONFIG_VHOST_IOTLB=y
> CONFIG_VHOST_RING=m
> CONFIG_VHOST=y
> CONFIG_VHOST_SCSI=m
> CONFIG_VHOST_VDPA=y
> 
> Full randconfig file is attached.
> 
> (This same build failure happens with today's linux-next, Mar. 31.)
> 
> @Yamada-san:  Is this a kbuild problem (or feature)?
> 
> -- 
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
