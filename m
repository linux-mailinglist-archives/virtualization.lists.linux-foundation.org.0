Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A0D78E8
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 16:42:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EA165E28;
	Tue, 15 Oct 2019 14:42:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 86352CBC
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 14:42:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 08BA26C5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 14:42:04 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Oct 2019 07:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,300,1566889200"; d="scan'208";a="195297518"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
	([10.252.56.217])
	by fmsmga007.fm.intel.com with ESMTP; 15 Oct 2019 07:42:03 -0700
Date: Tue, 15 Oct 2019 16:42:04 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: virtualization@lists.linux-foundation.org
Subject: 0-copy (was Re: question: asynchronous notification from vhost)
Message-ID: <20191015144203.GA1829@ubuntu>
References: <20191015092313.GA31275@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191015092313.GA31275@ubuntu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

On Tue, Oct 15, 2019 at 11:23:13AM +0200, Guennadi Liakhovetski wrote:
> Hi,
> 
> I'm developing a virtualised audio / DSP virtio and vhost driver pair 
> and I'm currently somewhat stuck trying to figure out how to 
> asynchronously notify the guest from the vhost driver. I'm using the 
> vhost_add_used_and_signal() function to return data back to the guest 
> in the guest context, when the guest initiated an operation, that's 
> working well. But how do I "kick" the guest from an asynchronous, e.g. 
> from an interrupt thread context?

I think I've solved that by using a vhost work queue. That brings me 
one step further, possibly, to the last larger problem to solve: the 
actual data transmission. My preference would be to use zero-copy 
for that, but so far I only see one example of zero-copy in 
drivers/vhost - in net.c and only in TX direction. As far as I 
understand that isn't a principal limitation of the vhost / virtio 
API, rather it's related to certain networking specifics. Am I 
right? Is it supposed to work in both firections, or are there 
problems?

Thanks
Guennadi
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
