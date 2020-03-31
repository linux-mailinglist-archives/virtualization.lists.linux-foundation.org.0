Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E19E199EDA
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 21:23:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8AF31888C8;
	Tue, 31 Mar 2020 19:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5mxMVfRdpJFj; Tue, 31 Mar 2020 19:23:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D8F8A888CF;
	Tue, 31 Mar 2020 19:23:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B59CCC07FF;
	Tue, 31 Mar 2020 19:23:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F447C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 19:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4A8CD25281
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 19:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6Qzd-4hh91c
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 19:23:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 4F73B2045E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 19:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585682587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/e6nQfwC87/bpSm3h+1zpH7ZWFpAx96l++8B4RdaGPs=;
 b=PCrf2183OAtRa0fCrKMkg+/N3QvFHNrhK6n77ayiRQqLI8rVNkdRdk85QP86Oe9ooxLOZx
 dclG+qnFequXC/h6B6rfs56o86fU4WW+cseVeaZEIgxDac7t/Xb1rRt+PBX7aqzCePIumz
 eIgJG885gU2gqheZ7GBCgjoSnNRGIrU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-rrqn8xy2OKezwML5fPpqZw-1; Tue, 31 Mar 2020 15:22:58 -0400
X-MC-Unique: rrqn8xy2OKezwML5fPpqZw-1
Received: by mail-wr1-f70.google.com with SMTP id i18so13314684wrx.17
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 12:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/e6nQfwC87/bpSm3h+1zpH7ZWFpAx96l++8B4RdaGPs=;
 b=a4WfaeBVud7tMQYXrMvx2DWtLA1Eq+gb5MuNV7T+LxiwRtDrhNJ5bQpSyp9Wy8lAz3
 vJz1Y8BO2hJ3viIq57pZmeW7kRHce6exMQEUfB1MhbG9dAS32dKN2VHBSoluvmnk4JJ7
 o1qYRQCp1USyHh0ZNnoPqWLn3/VimAl1tXnk35orxsEjo/344fyoqQt2E9YonovUVS9F
 eFjaB50WN41z1ih3JXtUnKmKvaDockQchuLRBWNkNMBk6xVMHBxGMTvqseG55+bUTp+2
 rN4oPkNSwKW7S48587Jsnpv/4STpdu47osXwmvH1KAsHn8O0cYklsxIN2ZuJ6YBh71qd
 E+cw==
X-Gm-Message-State: AGi0PuZ5igzI8NSPaqB/8xDUQ367r5kRf2UktuOURBeW1V65VSn0uQws
 doAztzwhnEuqKdTQuTmgmYDe1Mk2JFoyTWigCi9F7ivAGiUJ/a3XBV2DCAIgcDSWC+rG7GmH05v
 Qrdsk91nHC67HZRJr3DDIFswD9M0XyJaYIV3QSu+Q7Q==
X-Received: by 2002:a1c:8108:: with SMTP id c8mr410462wmd.50.1585682577019;
 Tue, 31 Mar 2020 12:22:57 -0700 (PDT)
X-Google-Smtp-Source: APiQypL6Aptv5lg4jzAxGBVMyYmTlEWQ5XMw3Zc2nN0PSD/j3eiBvj2Rc762TemaQntDs3cCx4+NfA==
X-Received: by 2002:a1c:8108:: with SMTP id c8mr410435wmd.50.1585682576785;
 Tue, 31 Mar 2020 12:22:56 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id v7sm25508548wrs.96.2020.03.31.12.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 12:22:56 -0700 (PDT)
Date: Tue, 31 Mar 2020 15:22:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: mmotm 2020-03-30-18-46 uploaded (VDPA + vhost)
Message-ID: <20200331152106-mutt-send-email-mst@kernel.org>
References: <20200331014748.ajL0G62jF%akpm@linux-foundation.org>
 <969cacf1-d420-223d-7cc7-5b1b2405ec2a@infradead.org>
 <20200331143437-mutt-send-email-mst@kernel.org>
 <9c03fee8-af1a-2035-b903-611a631094b0@infradead.org>
MIME-Version: 1.0
In-Reply-To: <9c03fee8-af1a-2035-b903-611a631094b0@infradead.org>
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

On Tue, Mar 31, 2020 at 11:42:47AM -0700, Randy Dunlap wrote:
> On 3/31/20 11:37 AM, Michael S. Tsirkin wrote:
> > On Tue, Mar 31, 2020 at 11:27:54AM -0700, Randy Dunlap wrote:
> >> On 3/30/20 6:47 PM, akpm@linux-foundation.org wrote:
> >>> The mm-of-the-moment snapshot 2020-03-30-18-46 has been uploaded to
> >>>
> >>>    http://www.ozlabs.org/~akpm/mmotm/
> >>>
> >>> mmotm-readme.txt says
> >>>
> >>> README for mm-of-the-moment:
> >>>
> >>> http://www.ozlabs.org/~akpm/mmotm/
> >>>
> >>> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> >>> more than once a week.
> >>>
> >>> You will need quilt to apply these patches to the latest Linus release (5.x
> >>> or 5.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> >>> http://ozlabs.org/~akpm/mmotm/series
> >>>
> >>> The file broken-out.tar.gz contains two datestamp files: .DATE and
> >>> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
> >>> followed by the base kernel version against which this patch series is to
> >>> be applied.
> >>>
> >>> This tree is partially included in linux-next.  To see which patches are
> >>> included in linux-next, consult the `series' file.  Only the patches
> >>> within the #NEXT_PATCHES_START/#NEXT_PATCHES_END markers are included in
> >>> linux-next.
> >>>
> >>>
> >>> A full copy of the full kernel tree with the linux-next and mmotm patches
> >>> already applied is available through git within an hour of the mmotm
> >>> release.  Individual mmotm releases are tagged.  The master branch always
> >>> points to the latest release, so it's constantly rebasing.
> >>>
> >>> 	https://github.com/hnaz/linux-mm
> >>
> >> on i386:
> >>
> >> ld: drivers/vhost/vdpa.o: in function `vhost_vdpa_init':
> >> vdpa.c:(.init.text+0x52): undefined reference to `__vdpa_register_driver'
> >> ld: drivers/vhost/vdpa.o: in function `vhost_vdpa_exit':
> >> vdpa.c:(.exit.text+0x14): undefined reference to `vdpa_unregister_driver'
> >>
> >>
> >>
> >> drivers/virtio/vdpa/ is not being built. (confusing!)
> >>
> >> CONFIG_VIRTIO=m
> >> # CONFIG_VIRTIO_MENU is not set
> >> CONFIG_VDPA=y
> > 
> > Hmm. OK. Can't figure it out. CONFIG_VDPA is set why isn't
> > drivers/virtio/vdpa/ built?
> > we have:
> > 
> 
> Ack.  Hopefully Yamada-san can tell us what is happening here.

OK I pushed a fix (moving the vdpa subsystem up a level) and pushed into
my tree, refs/heads/next .  Seems to build fine now, but I'd appreciate
it if you can give it a spin.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
