Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B06293A38
	for <lists.virtualization@lfdr.de>; Tue, 20 Oct 2020 13:45:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EF5102E127;
	Tue, 20 Oct 2020 11:45:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pKpaf9I-03ag; Tue, 20 Oct 2020 11:45:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BA3B52E130;
	Tue, 20 Oct 2020 11:45:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 996ABC0051;
	Tue, 20 Oct 2020 11:45:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3535C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Oct 2020 11:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CE4DC86ACB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Oct 2020 11:45:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DQ0XO78X9b3z
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Oct 2020 11:45:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4F01C86A78
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Oct 2020 11:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603194325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wDwUpRJnTUQ2pS+wnEOM7NYhKs7UkxzW53goaPdV3ss=;
 b=Z/vxwF7hpog/5f2RQO+UXK3idPmBESsjO8VRj0X08O6jDlf4ihCC/s2z8H49R0ctp1loIf
 YNF0hM2jivecunUyW5wbr5vYjsuR84AdipG4cmWbD+6eeBidM8BsAQ/LMYwVmfNSI/YbDZ
 Hq1uGpH+TMmTl/Wu6Fz1BNc7IML2Ags=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-PqmBdmdjM3Ggnc8VcMLgLg-1; Tue, 20 Oct 2020 07:45:20 -0400
X-MC-Unique: PqmBdmdjM3Ggnc8VcMLgLg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7CDD1074658;
 Tue, 20 Oct 2020 11:45:18 +0000 (UTC)
Received: from redhat.com (ovpn-112-214.ams2.redhat.com [10.36.112.214])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 847DA5D9EF;
 Tue, 20 Oct 2020 11:45:13 +0000 (UTC)
Date: Tue, 20 Oct 2020 07:45:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net v2] Revert "virtio-net: ethtool configurable RXCSUM"
Message-ID: <20201020073651-mutt-send-email-mst@kernel.org>
References: <20201018103122.454967-1-mst@redhat.com>
 <20201019121500.4620e276@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201019121500.4620e276@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Willem de Bruijn <willemb@google.com>, kernel test robot <lkp@intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>
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

On Mon, Oct 19, 2020 at 12:15:00PM -0700, Jakub Kicinski wrote:
> On Mon, 19 Oct 2020 13:32:12 -0400 Michael S. Tsirkin wrote:
> > This reverts commit 3618ad2a7c0e78e4258386394d5d5f92a3dbccf8.
> > 
> > When the device does not have a control vq (e.g. when using a
> > version of QEMU based on upstream v0.10 or older, or when specifying
> > ctrl_vq=off,ctrl_rx=off,ctrl_vlan=off,ctrl_rx_extra=off,ctrl_mac_addr=off
> > for the device on the QEMU command line), that commit causes a crash:
> 
> Hi Michael!
> 
> Only our very first (non-resend) version got into patchwork:
> 
> https://patchwork.ozlabs.org/project/netdev/list/?submitter=2235&state=*
> 
> Any ideas why?

I really don't! Any ideas?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
