Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FA211296
	for <lists.virtualization@lfdr.de>; Thu,  2 May 2019 07:27:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6127C2F88;
	Thu,  2 May 2019 05:27:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 82D3F2F7D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  2 May 2019 05:26:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 312528D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  2 May 2019 05:26:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91B863082AF4;
	Thu,  2 May 2019 05:26:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 023A47EE7B;
	Thu,  2 May 2019 05:26:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id EACC211AAF; Thu,  2 May 2019 07:26:30 +0200 (CEST)
Date: Thu, 2 May 2019 07:26:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jaak Ristioja <jaak@ristioja.ee>
Subject: Re: Xorg hangs in kernelspace with qxl
Message-ID: <20190502052630.ombyxjhvx2hskxgv@sirius.home.kraxel.org>
References: <20e78e41-ed6a-a8ea-07e5-f83f353b8eaa@ristioja.ee>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20e78e41-ed6a-a8ea-07e5-f83f353b8eaa@ristioja.ee>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 02 May 2019 05:26:32 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Dave Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org
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

On Wed, May 01, 2019 at 12:47:48AM +0300, Jaak Ristioja wrote:
> Hello!
> 
> I'm experiencing the following task hangs at least 2-3 times a day when
> using a Kubuntu desktop in KVM via a SPICE client. This has occurred
> with the stock kernels in Kubuntu since Kubuntu 18.04. This makes the VM
> unusable as a graphical remote desktop and the hung task prevents
> Kubuntu from gracefully rebooting (e.g. "reboot" via SSH). Any ideas?
> 
> INFO: task Xorg:879 blocked for more than 120 seconds.
>       Not tainted 5.0.0-13-generic #14-Ubuntu

Does it happen with 5.1-rc kernels too?

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
