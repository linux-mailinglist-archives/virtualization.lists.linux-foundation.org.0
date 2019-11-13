Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1039DFB550
	for <lists.virtualization@lfdr.de>; Wed, 13 Nov 2019 17:38:58 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 908C1CF3;
	Wed, 13 Nov 2019 16:38:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3BEDAC58
	for <virtualization@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 16:38:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 0F9E0CF
	for <virtualization@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 16:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573663129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=QqzCZrrw+N1LqLUBngxMhEYqWKp5yMdHfOeTcezaP3c=;
	b=B3fvV0aQqI2IdTj0FBfXfd9gyVROAqBr+BbM2U05MxVkct6bUtImRPAsYesHYBhWyT1YOG
	DIap0conT6MyRfVR5H993pRcNJJioW5rrwhENnWOh51DEuwC/+oSbmQbmnqbYLuX8F72AY
	kNq1KmqUiVkHKT/1zGiMfjY+rj/mXBg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-51-mqxzOLd_PaGwIalWb5rDyQ-1; Wed, 13 Nov 2019 11:38:48 -0500
Received: by mail-wr1-f69.google.com with SMTP id 4so1883817wrf.19
	for <virtualization@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 08:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=9rmRmGxbCej/NSmLlrw5qBptbx4sAiez+aV0DPKoxmk=;
	b=W+pBV8EuC5fQd7hZU6hd+0RwtWRvd1PByBkKQqpLfUaAZtVXV/La3FInmuMwRl2qFe
	+AZ6oYfbvhoXxJ+NwUGE1XL6jHMM+IPj5RBmnddPtAWlXfR15AudR08WXVoDEpMQdr4V
	xgCKBjNB4d3Xu8+A9qN6fU7eBRbltO8hfAO2ee8dMga8RD3utNPi1sZSSwIIayMLU5qh
	PeP4bwjV8Xzl5WvwmVAqapxnag0i2aRk98uW0EuF0Nu3yY0jJ+QUOrM4v8rh/MV6yXak
	i3gbeEThVrHcfgudYOQHpU0Ew16PE0U1FVGfM6JU2ytVS5k3Aa4tAjW3h/OMhuyEp2i+
	mfZA==
X-Gm-Message-State: APjAAAVKjvljxU6uZpStCzvBMs+PAWhWw6i/9J5sUcfJOsy21D5J4lBN
	PaAeiT3zpP3c9XHCV6RIgOQjC20g1A9opILbasCSOoCxluIP7f8552pp/CN2xDZTtOtmgSJ6W6p
	FScIP/Qt3+G0dP2xnKJRCUhke1sL8aPh2ATeTP2QT4Q==
X-Received: by 2002:adf:f0c4:: with SMTP id x4mr2417507wro.217.1573663126802; 
	Wed, 13 Nov 2019 08:38:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXrDaHddzqNUvTPvMV4jXm5tNoMjrSJ3IvH3rKSatkd4o3Pvp2hT95nFuBwmA+H3+NDewgsg==
X-Received: by 2002:adf:f0c4:: with SMTP id x4mr2417472wro.217.1573663126527; 
	Wed, 13 Nov 2019 08:38:46 -0800 (PST)
Received: from steredhat (a-nu5-32.tin.it. [212.216.181.31])
	by smtp.gmail.com with ESMTPSA id
	q17sm2813058wmj.12.2019.11.13.08.38.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Nov 2019 08:38:45 -0800 (PST)
Date: Wed, 13 Nov 2019 17:38:42 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH net-next 11/14] vsock: add multi-transports support
Message-ID: <20191113163842.6byl2qul4nbjf5no@steredhat>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-12-sgarzare@redhat.com>
	<MWHPR05MB33761FE4DA27130C72FC5048DA740@MWHPR05MB3376.namprd05.prod.outlook.com>
	<20191111171740.xwo7isdmtt7ywibo@steredhat>
	<MWHPR05MB33764F82AFA882B921A11E56DA770@MWHPR05MB3376.namprd05.prod.outlook.com>
	<20191112103630.vd3kbk7xnplv6rey@steredhat>
	<MWHPR05MB3376560CFD2A710723843828DA760@MWHPR05MB3376.namprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <MWHPR05MB3376560CFD2A710723843828DA760@MWHPR05MB3376.namprd05.prod.outlook.com>
X-MC-Unique: mqxzOLd_PaGwIalWb5rDyQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>, Arnd Bergmann <arnd@arndb.de>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>
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

On Wed, Nov 13, 2019 at 02:30:24PM +0000, Jorgen Hansen wrote:
> > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > Sent: Tuesday, November 12, 2019 11:37 AM
> 
> > > > > You already mentioned that you are working on a fix for loopback
> > > > > here for the guest, but presumably a host could also do loopback.
> > > >
> > > > IIUC we don't support loopback in the host, because in this case the
> > > > application will use the CID_HOST as address, but if we are in a nested
> > > > VM environment we are in trouble.
> > >
> > > If both src and dst CID are CID_HOST, we should be fairly sure that this
> > > Is host loopback, no? If src is anything else, we would do G2H.
> > >
> > 
> > The problem is that we don't know the src until we assign a transport
> > looking at the dst. (or if the user bound the socket to CID_HOST before
> > the connect(), but it is not very common)
> > 
> > So if we are in a L1 and the user uses the local guest CID, it works, but if
> > it uses the HOST_CID, the packet will go to the L0.
> > 
> > If we are in L0, it could be simple, because we can simply check if G2H
> > is not loaded, so any packet to CID_HOST, is host loopback.
> > 
> > I think that if the user uses the IOCTL_VM_SOCKETS_GET_LOCAL_CID, to set
> > the dest CID for the loopback, it works in both cases because we return the
> > HOST_CID in L0, and always the guest CID in L1, also if a H2G is loaded to
> > handle the L2.
> > 
> > Maybe we should document this in the man page.
> 
> Yeah, it seems like a good idea to flesh out the routing behavior for nested
> VMs in the man page.

I'll do it.

> 
> > 
> > But I have a question: Does vmci support the host loopback?
> > I've tried, and it seems not.
> 
> Only for datagrams - not for stream sockets.
>  

Ok, I'll leave the datagram loopback as before.

> > Also vhost-vsock doesn't support it, but virtio-vsock does.
> > 
> > > >
> > > > Since several people asked about this feature at the KVM Forum, I would
> > like
> > > > to add a new VMADDR_CID_LOCAL (i.e. using the reserved 1) and
> > implement
> > > > loopback in the core.
> > > >
> > > > What do you think?
> > >
> > > What kind of use cases are mentioned in the KVM forum for loopback?
> > One concern
> > > is that we have to maintain yet another interprocess communication
> > mechanism,
> > > even though other choices exist already  (and those are likely to be more
> > efficient
> > > given the development time and specific focus that went into those). To
> > me, the
> > > local connections are mainly useful as a way to sanity test the protocol and
> > transports.
> > > However, if loopback is compelling, it would make sense have it in the core,
> > since it
> > > shouldn't need a specific transport.
> > 
> > The common use cases is for developer point of view, and to test the
> > protocol and transports as you said.
> > 
> > People that are introducing VSOCK support in their projects, would like to
> > test them on their own PC without starting a VM.
> > 
> > The idea is to move the code to handle loopback from the virtio-vsock,
> > in the core, but in another series :-)
> 
> OK, that makes sense.

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
