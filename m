Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 631DA5ECE58
	for <lists.virtualization@lfdr.de>; Tue, 27 Sep 2022 22:23:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 231D44014B;
	Tue, 27 Sep 2022 20:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 231D44014B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q6qGLdMT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TKs-x8-0P7at; Tue, 27 Sep 2022 20:23:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B1F4A4013D;
	Tue, 27 Sep 2022 20:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1F4A4013D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8B3EC0078;
	Tue, 27 Sep 2022 20:23:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADF18C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Sep 2022 20:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F31760AA0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Sep 2022 20:23:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F31760AA0
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q6qGLdMT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JhcESSJnJv2b
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Sep 2022 20:23:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ACB060736
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ACB060736
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Sep 2022 20:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664310222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bPS2hzRpnh4vS84t7HeCrT88khQ6cmZJEXbF5+gL9zE=;
 b=Q6qGLdMTSJaxvtk3NNBe0spd8TariT3x96oAEt8n6TxT5QEDUqw0HlSgg2TTpEM38lWnBm
 6Zjgv0cX5v+mrtjKGVwv8mPmuPcujJQimoG/Aqq+/gNJuGcAAIX4hTWVjunMGasc6EVroP
 hc7BsGHlDSc0N6W7+lbbav/asLQk7gA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-9AAP5CVNNX6b3jHBjeB7fw-1; Tue, 27 Sep 2022 16:23:40 -0400
X-MC-Unique: 9AAP5CVNNX6b3jHBjeB7fw-1
Received: by mail-wm1-f70.google.com with SMTP id
 c3-20020a7bc843000000b003b486fc6a40so3143907wml.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Sep 2022 13:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date;
 bh=bPS2hzRpnh4vS84t7HeCrT88khQ6cmZJEXbF5+gL9zE=;
 b=0Ov0R1ELf7bMZ0VZgHY1n35GYT6BQdEaSGcQYS7h9R0v+ty8N/pbIZAMddHvYvd4hg
 IQrCcodsDn9pVhg2l6bb+nNhgF4szdFbSHpE9Rf5LAuIUQwIo1AeHXkv8m4XgSnWlr80
 Gm38MZeB07MV6e2WqiifqhflNHkkTEZc7KVlDaf6oocJkGTRAuQJT78ZJSP9Hnm1Z+mz
 Gf7ASjEExb/WyNhAw+EzPC+lY/Wb1gMO9h1SdQ1lupvUeGxaB/WbZZheGeCYq2EyVplQ
 wSOf/dilCkG5KxBOdmOBlAjoY1o5BuzoI44jPgFx5BTtmxFVMHEY8fWAcHUstbLe7wKo
 EqjQ==
X-Gm-Message-State: ACrzQf0RmXXNec2/+5uKprz+cOgDpOybYxBcG6k8i+nL6RO4LZR1JPmX
 E5R11PX+C5fx+GsHpmZaYhKTmazU86QeoWnSBK2Jzt8DgaAFVoqAWrpJk9B+JHK9hkYb455R95s
 pIy8SCsdWYUSZHtMAV9TpXHbbAOf12cDTCodh4aygvA==
X-Received: by 2002:a05:6000:18ad:b0:22a:f7b5:16f8 with SMTP id
 b13-20020a05600018ad00b0022af7b516f8mr18132912wri.305.1664310219380; 
 Tue, 27 Sep 2022 13:23:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6ci15yCp/mYBPh7Hxm1QkwLOuat3oDTUzqTHSVWObghnWMRosUrppkyN/V4CuayXBq254sVg==
X-Received: by 2002:a05:6000:18ad:b0:22a:f7b5:16f8 with SMTP id
 b13-20020a05600018ad00b0022af7b516f8mr18132903wri.305.1664310219067; 
 Tue, 27 Sep 2022 13:23:39 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-104-40.dyn.eolo.it.
 [146.241.104.40]) by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c461100b003a5fa79007fsm2520605wmo.7.2022.09.27.13.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 13:23:38 -0700 (PDT)
Message-ID: <b06d81fe39710b948a74a365c173b316252ed1f8.camel@redhat.com>
Subject: Re: [PATCH net-next 0/4] shrink struct ubuf_info
From: Paolo Abeni <pabeni@redhat.com>
To: Pavel Begunkov <asml.silence@gmail.com>, netdev@vger.kernel.org
Date: Tue, 27 Sep 2022 22:23:37 +0200
In-Reply-To: <eb543907-190f-c661-b5d6-b4d67b6184e6@gmail.com>
References: <cover.1663892211.git.asml.silence@gmail.com>
 <7fef56880d40b9d83cc99317df9060c4e7cdf919.camel@redhat.com>
 <021d8ea4-891c-237d-686e-64cecc2cc842@gmail.com>
 <bbb212f6-0165-0747-d99d-b49acbb02a80@gmail.com>
 <85cccb780608e830024fc82a8e4f703031646f4e.camel@redhat.com>
 <c06897d4-4883-2756-87f9-9b10ab495c43@gmail.com>
 <6502e1a45526f97a1e6d7d27bbe07e3bb3623de3.camel@redhat.com>
 <eb543907-190f-c661-b5d6-b4d67b6184e6@gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Wei Liu <wei.liu@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
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

On Tue, 2022-09-27 at 21:17 +0100, Pavel Begunkov wrote:
> On 9/27/22 20:59, Paolo Abeni wrote:
> > On Tue, 2022-09-27 at 19:48 +0100, Pavel Begunkov wrote:
> > > On 9/27/22 18:56, Paolo Abeni wrote:
> > > > On Tue, 2022-09-27 at 18:16 +0100, Pavel Begunkov wrote:
> > > > > On 9/27/22 15:28, Pavel Begunkov wrote:
> > > > > > Hello Paolo,
> > > > > > 
> > > > > > On 9/27/22 14:49, Paolo Abeni wrote:
> > > > > > > Hello,
> > > > > > > 
> > > > > > > On Fri, 2022-09-23 at 17:39 +0100, Pavel Begunkov wrote:
> > > > > > > > struct ubuf_info is large but not all fields are needed for all
> > > > > > > > cases. We have limited space in io_uring for it and large ubuf_info
> > > > > > > > prevents some struct embedding, even though we use only a subset
> > > > > > > > of the fields. It's also not very clean trying to use this typeless
> > > > > > > > extra space.
> > > > > > > > 
> > > > > > > > Shrink struct ubuf_info to only necessary fields used in generic paths,
> > > > > > > > namely ->callback, ->refcnt and ->flags, which take only 16 bytes. And
> > > > > > > > make MSG_ZEROCOPY and some other users to embed it into a larger struct
> > > > > > > > ubuf_info_msgzc mimicking the former ubuf_info.
> > > > > > > > 
> > > > > > > > Note, xen/vhost may also have some cleaning on top by creating
> > > > > > > > new structs containing ubuf_info but with proper types.
> > > > > > > 
> > > > > > > That sounds a bit scaring to me. If I read correctly, every uarg user
> > > > > > > should check 'uarg->callback == msg_zerocopy_callback' before accessing
> > > > > > > any 'extend' fields.
> > > > > > 
> > > > > > Providers of ubuf_info access those fields via callbacks and so already
> > > > > > know the actual structure used. The net core, on the opposite, should
> > > > > > keep it encapsulated and not touch them at all.
> > > > > > 
> > > > > > The series lists all places where we use extended fields just on the
> > > > > > merit of stripping the structure of those fields and successfully
> > > > > > building it. The only user in net/ipv{4,6}/* is MSG_ZEROCOPY, which
> > > > > > again uses callbacks.
> > > > > > 
> > > > > > Sounds like the right direction for me. There is a couple of
> > > > > > places where it might get type safer, i.e. adding types instead
> > > > > > of void* in for struct tun_msg_ctl and getting rid of one macro
> > > > > > hiding types in xen. But seems more like TODO for later.
> > > > > > 
> > > > > > > AFAICS the current code sometimes don't do the
> > > > > > > explicit test because the condition is somewhat implied, which in turn
> > > > > > > is quite hard to track.
> > > > > > > 
> > > > > > > clearing uarg->zerocopy for the 'wrong' uarg was armless and undetected
> > > > > > > before this series, and after will trigger an oops..
> > > > > > 
> > > > > > And now we don't have this field at all to access, considering that
> > > > > > nobody blindly casts it.
> > > > > > 
> > > > > > > There is some noise due to uarg -> uarg_zc renaming which make the
> > > > > > > series harder to review. Have you considered instead keeping the old
> > > > > > > name and introducing a smaller 'struct ubuf_info_common'? the overall
> > > > > > > code should be mostly the same, but it will avoid the above mentioned
> > > > > > > noise.
> > > > > > 
> > > > > > I don't think there will be less noise this way, but let me try
> > > > > > and see if I can get rid of some churn.
> > > > > 
> > > > > It doesn't look any better for me
> > > > > 
> > > > > TL;DR; This series converts only 3 users: tap, xen and MSG_ZEROCOPY
> > > > > and doesn't touch core code. If we do ubuf_info_common though I'd need
> > > > > to convert lots of places in skbuff.c and multiple places across
> > > > > tcp/udp, which is much worse.
> > > > 
> > > > Uhmm... I underlook the fact we must preserve the current accessors for
> > > > the common fields.
> > > > 
> > > > I guess something like the following could do (completely untested,
> > > > hopefully should illustrate the idea):
> > > > 
> > > > struct ubuf_info {
> > > > 	struct_group_tagged(ubuf_info_common, common,
> > > > 		void (*callback)(struct sk_buff *, struct ubuf_info *,
> > > >                            bool zerocopy_success);
> > > > 		refcount_t refcnt;
> > > > 	        u8 flags;
> > > > 	);
> > > > 
> > > > 	union {
> > > >                   struct {
> > > >                           unsigned long desc;
> > > >                           void *ctx;
> > > >                   };
> > > >                   struct {
> > > >                           u32 id;
> > > >                           u16 len;
> > > >                           u16 zerocopy:1;
> > > >                           u32 bytelen;
> > > >                   };
> > > >           };
> > > > 
> > > >           struct mmpin {
> > > >                   struct user_struct *user;
> > > >                   unsigned int num_pg;
> > > >           } mmp;
> > > > };
> > > > 
> > > > Then you should be able to:
> > > > - access ubuf_info->callback,
> > > > - access the same field via ubuf_info->common.callback
> > > > - declare variables as 'struct ubuf_info_commom' with appropriate
> > > > contents.
> > > > 
> > > > WDYT?
> > > 
> > > Interesting, I didn't think about struct_group, this would
> > > let to split patches better and would limit non-core changes.
> > > But if the plan is to convert the core helpers to
> > > ubuf_info_common, than I think it's still messier than changing
> > > ubuf providers only.
> > > 
> > > I can do the exercise, but I don't really see what is the goal.
> > > Let me ask this, if we forget for a second how diffs look,
> > > do you care about which pair is going to be in the end?
> > 
> > Uhm... I proposed this initially with the goal of remove non fuctional
> > changes from a patch that was hard to digest for me (4/4). So it's
> > about diffstat to me ;)
> 
> Ah, got it
> 
> > On the flip side the change suggested would probably not be as
> > straighforward as I would hope for.
> > 
> > > ubuf_info_common/ubuf_info vs ubuf_info/ubuf_info_msgzc?
> > 
> > The specific names used are not much relevant.
> > 
> > > Are there you concerned about naming or is there more to it?
> > 
> > I feel like this series is potentially dangerous, but I could not spot
> > bugs into the code. I would have felt more relaxed eariler in the devel
> > cycle.
> 
> union {
> 	struct {
> 		unsigned long desc;
> 		void *ctx;
> 	};
> 	struct {
> 		u32 id;
> 		u16 len;
> 		u16 zerocopy:1;
> 		u32 bytelen;
> 	};
> };
> 
> 
> btw, nobody would frivolously change ->zerocopy anyway as it's
> in a union. Even without the series we're absolutely screwed
> if someone does that. If anything it adds a way to get rid of it:
> 
> 1) Make vhost and xen use their own structures with right types.
> 2) kill unused struct {ctx, desc} for MSG_ZEROCOPY

Ok, the above sounds reasonable. Additionally I've spent the last
surviving neuron on my side to on this series, and it looks sane, so...

Acked-by: Paolo Abeni <pabeni@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
