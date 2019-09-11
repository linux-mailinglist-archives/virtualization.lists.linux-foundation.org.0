Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B85AFD77
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 15:12:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BB8D3A49;
	Wed, 11 Sep 2019 13:12:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E893AA49
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 13:12:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ABD11896
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 13:12:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 0B042B687;
	Wed, 11 Sep 2019 13:12:36 +0000 (UTC)
Date: Wed, 11 Sep 2019 15:12:35 +0200
From: Michal Hocko <mhocko@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2] vhost: block speculation of translated descriptors
Message-ID: <20190911131235.GZ4023@dhcp22.suse.cz>
References: <20190911120908.28410-1-mst@redhat.com>
	<20190911121628.GT4023@dhcp22.suse.cz>
	<20190911082236-mutt-send-email-mst@kernel.org>
	<20190911123316.GX4023@dhcp22.suse.cz>
	<20190911085807-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911085807-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
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

On Wed 11-09-19 09:03:10, Michael S. Tsirkin wrote:
> On Wed, Sep 11, 2019 at 02:33:16PM +0200, Michal Hocko wrote:
> > On Wed 11-09-19 08:25:03, Michael S. Tsirkin wrote:
> > > On Wed, Sep 11, 2019 at 02:16:28PM +0200, Michal Hocko wrote:
> > > > On Wed 11-09-19 08:10:00, Michael S. Tsirkin wrote:
> > > > > iovec addresses coming from vhost are assumed to be
> > > > > pre-validated, but in fact can be speculated to a value
> > > > > out of range.
> > > > > 
> > > > > Userspace address are later validated with array_index_nospec so we can
> > > > > be sure kernel info does not leak through these addresses, but vhost
> > > > > must also not leak userspace info outside the allowed memory table to
> > > > > guests.
> > > > > 
> > > > > Following the defence in depth principle, make sure
> > > > > the address is not validated out of node range.
> > > > > 
> > > > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > > > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > > > Tested-by: Jason Wang <jasowang@redhat.com>
> > > > 
> > > > no need to mark fo stable? Other spectre fixes tend to be backported
> > > > even when the security implications are not really clear. The risk
> > > > should be low and better to be covered in case.
> > > 
> > > This is not really a fix - more a defence in depth thing,
> > > quite similar to e.g.  commit b3bbfb3fb5d25776b8e3f361d2eedaabb0b496cd
> > > x86: Introduce __uaccess_begin_nospec() and uaccess_try_nospec
> > > in scope.
> > >
> > > That one doesn't seem to be tagged for stable. Was it queued
> > > there in practice?
> > 
> > not marked for stable but it went in. At least to 4.4.
> 
> So I guess the answer is I don't know. If you feel it's
> justified, then sure, feel free to forward.

Well, that obviously depends on you as a maintainer but the point is
that spectre gatgets are quite hard to find. There is a smack check
AFAIK but that generates quite some false possitives and it is PITA to
crawl through those. If you want an interesting (I am not saying
vulnerable on purpose) gatget then it would be great to mark it for
stable so all stable consumers (disclaimer: I am not one of those) and
add that really great feeling of safety ;)

So take this as my 2c
-- 
Michal Hocko
SUSE Labs
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
