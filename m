Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6FEAFD50
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 15:03:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 70AA913D2;
	Wed, 11 Sep 2019 13:03:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 62F8D13B6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 13:03:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EF1A4894
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 13:03:17 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B64A811DC
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 13:03:17 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id s3so1663992qkd.6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 06:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=/sfNjqGMZWLcI3m0N4VrOWVEum1o031nknNQPF2WES8=;
	b=dSNrcr+wTL7DbN1fKWk+GhfduvaFMdbV5u7L30DzdHEjiwjuyh8WLERWwm/YyWTOyX
	LGwGL0/MjE4GMj/9psxOAoWoUHNTYGSDFCieCLtHjx4QR56v6wAzohw2lQ6JeBaxyp3E
	FKLR7RlNaD8W30TelOwSZf91PVoKRZ5nvkQ6wPvP0MjgvAFuWywWVCUQO0C7TZFSXBoi
	XUeSQGHg8jMY4ADSIoll0AGNotmg8fCdHanN9u04xGd8NVvH1PTb8HpbYiTiMbHGhE+Z
	P5RWnqwUSCNPuQCySSk0y4LXlXXf6Zgbxiy2rw9uoOHqMkJyOoqv4n5nQjhixVTU/a4i
	iA1w==
X-Gm-Message-State: APjAAAWaNHX9qKzlVe/nQIqfDB86K4Urz0vz/+7mG3qAf/Kt1qNHEuj4
	MqzOl4+nR4FwdRrU4mOmCOq5VbEBDCaexrb175AV55BRVg/hHQfoaEJQOoNmJAj+bBn3Qwd2Avh
	VaPzVvyxJREnp6gojfMPwlsUfJ5p64Raeui0PYf2o3w==
X-Received: by 2002:ac8:7242:: with SMTP id l2mr35745593qtp.4.1568206996776;
	Wed, 11 Sep 2019 06:03:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwmsmhjoHJTb7z6oORqOFoKPWxTBsyQouHREJ+8K5GPemL48MacSn+bJagBRzKL996ErgPJyA==
X-Received: by 2002:ac8:7242:: with SMTP id l2mr35745571qtp.4.1568206996537;
	Wed, 11 Sep 2019 06:03:16 -0700 (PDT)
Received: from redhat.com ([80.74.107.118])
	by smtp.gmail.com with ESMTPSA id v2sm6615278qtv.22.2019.09.11.06.03.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 06:03:15 -0700 (PDT)
Date: Wed, 11 Sep 2019 09:03:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: [PATCH v2] vhost: block speculation of translated descriptors
Message-ID: <20190911085807-mutt-send-email-mst@kernel.org>
References: <20190911120908.28410-1-mst@redhat.com>
	<20190911121628.GT4023@dhcp22.suse.cz>
	<20190911082236-mutt-send-email-mst@kernel.org>
	<20190911123316.GX4023@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911123316.GX4023@dhcp22.suse.cz>
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Wed, Sep 11, 2019 at 02:33:16PM +0200, Michal Hocko wrote:
> On Wed 11-09-19 08:25:03, Michael S. Tsirkin wrote:
> > On Wed, Sep 11, 2019 at 02:16:28PM +0200, Michal Hocko wrote:
> > > On Wed 11-09-19 08:10:00, Michael S. Tsirkin wrote:
> > > > iovec addresses coming from vhost are assumed to be
> > > > pre-validated, but in fact can be speculated to a value
> > > > out of range.
> > > > 
> > > > Userspace address are later validated with array_index_nospec so we can
> > > > be sure kernel info does not leak through these addresses, but vhost
> > > > must also not leak userspace info outside the allowed memory table to
> > > > guests.
> > > > 
> > > > Following the defence in depth principle, make sure
> > > > the address is not validated out of node range.
> > > > 
> > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > > Tested-by: Jason Wang <jasowang@redhat.com>
> > > 
> > > no need to mark fo stable? Other spectre fixes tend to be backported
> > > even when the security implications are not really clear. The risk
> > > should be low and better to be covered in case.
> > 
> > This is not really a fix - more a defence in depth thing,
> > quite similar to e.g.  commit b3bbfb3fb5d25776b8e3f361d2eedaabb0b496cd
> > x86: Introduce __uaccess_begin_nospec() and uaccess_try_nospec
> > in scope.
> >
> > That one doesn't seem to be tagged for stable. Was it queued
> > there in practice?
> 
> not marked for stable but it went in. At least to 4.4.

So I guess the answer is I don't know. If you feel it's
justified, then sure, feel free to forward.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
