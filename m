Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E3836FA91
	for <lists.virtualization@lfdr.de>; Fri, 30 Apr 2021 14:40:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CACF04022A;
	Fri, 30 Apr 2021 12:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29EO17h-laxu; Fri, 30 Apr 2021 12:40:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id A229C402AB;
	Fri, 30 Apr 2021 12:40:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33EB3C0001;
	Fri, 30 Apr 2021 12:40:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A496C0001
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 12:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 288FC41916
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 12:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmpUC40B4uYQ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 12:40:25 +0000 (UTC)
X-Greylist: delayed 00:08:12 by SQLgrey-1.8.0
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AA92400AE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 30 Apr 2021 12:40:25 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.83])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6B8639FA2376;
 Fri, 30 Apr 2021 14:32:10 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 30 Apr
 2021 14:32:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005cdc44ea9-f93d-4031-ada4-e572ec5fe9cb,
 14EB31E95D912E67FA697F35DD0A608B5C282F17) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 30 Apr 2021 14:32:08 +0200
From: Greg Kurz <groug@kaod.org>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH v2] virtiofs: propagate sync() to file server
Message-ID: <20210430143208.3d826302@bahia.lan>
In-Reply-To: <20210430121757.GA1936051@redhat.com>
References: <20210426151011.840459-1-groug@kaod.org>
 <20210427171206.GA1805363@redhat.com>
 <20210427210921.7b01c661@bahia.lan>
 <20210430121757.GA1936051@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: cd2eecc2-74fb-4e7c-9c50-968357de846f
X-Ovh-Tracer-Id: 17927141269092407660
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrvddviedgheegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheprhhlkhesrhgvughhrghtrdgtohhm
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, linux-fsdevel@vger.kernel.org,
 Robert Krawitz <rlk@redhat.com>
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

On Fri, 30 Apr 2021 08:17:57 -0400
Vivek Goyal <vgoyal@redhat.com> wrote:

> On Tue, Apr 27, 2021 at 09:09:21PM +0200, Greg Kurz wrote:
> [..]
> > > > diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> > > > index 54442612c48b..1265ca17620c 100644
> > > > --- a/include/uapi/linux/fuse.h
> > > > +++ b/include/uapi/linux/fuse.h
> > > > @@ -179,6 +179,9 @@
> > > >   *  7.33
> > > >   *  - add FUSE_HANDLE_KILLPRIV_V2, FUSE_WRITE_KILL_SUIDGID, FATTR_KILL_SUIDGID
> > > >   *  - add FUSE_OPEN_KILL_SUIDGID
> > > > + *
> > > > + *  7.34
> > > > + *  - add FUSE_SYNCFS
> > > >   */
> > > >  
> > > >  #ifndef _LINUX_FUSE_H
> > > > @@ -214,7 +217,7 @@
> > > >  #define FUSE_KERNEL_VERSION 7
> > > >  
> > > >  /** Minor version number of this interface */
> > > > -#define FUSE_KERNEL_MINOR_VERSION 33
> > > > +#define FUSE_KERNEL_MINOR_VERSION 34
> > > >  
> > > >  /** The node ID of the root inode */
> > > >  #define FUSE_ROOT_ID 1
> > > > @@ -499,6 +502,7 @@ enum fuse_opcode {
> > > >  	FUSE_COPY_FILE_RANGE	= 47,
> > > >  	FUSE_SETUPMAPPING	= 48,
> > > >  	FUSE_REMOVEMAPPING	= 49,
> > > > +	FUSE_SYNCFS		= 50,
> > > >  
> > > >  	/* CUSE specific operations */
> > > >  	CUSE_INIT		= 4096,
> > > > @@ -957,4 +961,8 @@ struct fuse_removemapping_one {
> > > >  #define FUSE_REMOVEMAPPING_MAX_ENTRY   \
> > > >  		(PAGE_SIZE / sizeof(struct fuse_removemapping_one))
> > > >  
> > > > +struct fuse_syncfs_in {
> > > > +	uint64_t flags;
> > > > +};
> > > > +
> > > 
> > > Hi Greg,
> > > 
> > > Will it be better if 32bits are for flags and reset 32 are
> > > padding and can be used in whatever manner.
> > > 
> > > struct fuse_syncfs_in {
> > > 	uint32_t flags;
> > > 	uint32_t padding;
> > > };
> > > 
> > > This will increase the flexibility if we were to send more information
> > > in future.
> > > 
> > > I already see bunch of structures where flags are 32 bit and reset
> > > are padding bits. fuse_read_in, fuse_write_in, fuse_rename2_in etc.
> > > 
> > > Thanks
> > > Vivek
> > > 
> > 
> > Yes, it makes sense. I'll wait a few more days and roll out a v3.
> 
> Thinking more about it. We are not using any of the fields of this
> structure right now. So may be all of it can be padding and no need
> to add "flags".
> 
> struct fuse_syncfs_in {
> 	uint64_t padding;
> };
> 
> Essentially what you have already done  :-). Just rename flags to
> padding/unused to make it clear its unused for now.
> 

Yeah and this would allow to get rid of the assert() on non-zero flags
on the virtiofsd size, which was looking a bit awkward :-)

> Vivek
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
