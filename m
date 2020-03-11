Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0702C181095
	for <lists.virtualization@lfdr.de>; Wed, 11 Mar 2020 07:22:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4842A21FAD;
	Wed, 11 Mar 2020 06:22:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngg1OeogONTQ; Wed, 11 Mar 2020 06:22:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6A8E021567;
	Wed, 11 Mar 2020 06:22:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C425C0177;
	Wed, 11 Mar 2020 06:22:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36FDDC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 06:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2811A87D56
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 06:22:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ip8V6TeG0Dns
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 06:22:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5B96687CB2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 06:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pf947Sz8KajuMchFemWX1Gjf7sTMlNiajIDEANCcWHc=; b=lWwM3q+wSWfi640WOScA7e/8Ff
 bzpTUf1/fPZx31bOeQW126dE72TeZqb7YX3wbzSYKbh/h51bj9HZiTPzFsemYAGr5daIQMGtzB558
 bBD3oFuz3vrYx1G3GkQ1Bzs/w+3/dUQwnJu6fo/6RbAUcFFIGlSviUGWHH8WWNAWZAoxYA+ubqBdM
 0FNsqU3cBEZ1b+nOigEMUE5KXNeSgwISnCQKu0QqLGxSRvUK+6Dw0N3vRYruheqYFDwjQZnh52qHF
 mE7APR5cTlxmp/a80cO1ifELTyeq//ECkDOMnj/ezFRFhz8S4WGKI7dFyQvA7KMVWnersGOqE5odO
 HYyvXOZA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jBulA-0001TU-6S; Wed, 11 Mar 2020 06:22:28 +0000
Date: Tue, 10 Mar 2020 23:22:28 -0700
From: Christoph Hellwig <hch@infradead.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH RFC v2 02/24] scsi: allocate separate queue for reserved
 commands
Message-ID: <20200311062228.GA13522@infradead.org>
References: <1583857550-12049-1-git-send-email-john.garry@huawei.com>
 <1583857550-12049-3-git-send-email-john.garry@huawei.com>
 <20200310183243.GA14549@infradead.org>
 <79cf4341-f2a2-dcc9-be0d-2efc6e83028a@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79cf4341-f2a2-dcc9-be0d-2efc6e83028a@huawei.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
 Hannes Reinecke <hare@suse.com>, bvanassche@acm.org,
 martin.petersen@oracle.com, chenxiang66@hisilicon.com, jejb@linux.ibm.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 ming.lei@redhat.com, Christoph Hellwig <hch@infradead.org>,
 linux-scsi@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Tue, Mar 10, 2020 at 09:08:56PM +0000, John Garry wrote:
> On 10/03/2020 18:32, Christoph Hellwig wrote:
> > On Wed, Mar 11, 2020 at 12:25:28AM +0800, John Garry wrote:
> > > From: Hannes Reinecke <hare@suse.com>
> > > 
> > > Allocate a separate 'reserved_cmd_q' for sending reserved commands.
> > 
> > Why?  Reserved command specifically are not in any way tied to queues.
> > .
> > 
> 
> So the v1 series used a combination of the sdev queue and the per-host
> reserved_cmd_q. Back then you questioned using the sdev queue for virtio
> scsi, and the unconfirmed conclusion was to use a common per-host q. This is
> the best link I can find now:
> 
> https://www.mail-archive.com/linux-scsi@vger.kernel.org/msg83177.html

That was just a question on why virtio uses the per-device tags, which
didn't look like it made any sense.  What I'm worried about here is
mixing up the concept of reserved tags in the tagset, and queues to use
them.  Note that we already have the scsi_get_host_dev to allocate
a scsi_device and thus a request_queue for the host itself.  That seems
like the better interface to use a tag for a host wide command vs
introducing a parallel path.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
