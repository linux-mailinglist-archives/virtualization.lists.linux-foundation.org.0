Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5BBF8C6A
	for <lists.virtualization@lfdr.de>; Tue, 12 Nov 2019 11:04:03 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 453091572;
	Tue, 12 Nov 2019 10:03:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2C7921567
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 10:03:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770072.outbound.protection.outlook.com [40.107.77.72])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 92459DF
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 10:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=VSn7pUrYOI7MCzIyka7wWeX1AXA0Z7zjhXJ8PDVGWUlNLThl7TzKYOGY5Wt06ZHe0wo8/t99GoY16p8/C2QJJ5FWngA5b8r9zA+V2aa1GjFRWW0d7f1QUipJQ3sPyd5/TpLgChiB2ZEP8fv/SgXKl3JvnDmmVZCWedn0ogb0ibX2z0scKaUKGMr1pKiR6HldlEIb+T7FzHYniRQYStrfcEDtPavmlAif9ZA5J9tlacsbRwomiiDOLmVr+y8IZRXryzzgjpWC8rLhPyN1o4cspe8JYT1P6ndGnTSy8YroQ5DYp2EwDnZumpKl4WnW0vEkluhoTQ8FUWE1wGrlfcULjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/HO/x6devdd6+YjosteSm9fciE0iF7fXqKQYDx0tb4Y=;
	b=SaAu+leT+7EqHy6JlD49ZhUfGEdTgVdUnN/LETUinZyQB1GTqG21qcnLohqYV0ha4lx05E4Thxlf2go49OvZTTNBSYQklc0uXqHriQdod18iQ69gYY8n8b/FWU6kqeRwnE55rlVNkcPcSaLpimMpU4qYOCSLuviG3NFhskySOv7QP1QjAswXxrk4uSy5kQS+IQbn3heL6tg6DCdrEVOGUDKlgtvUsFzhpEkTd8TD//vktdl+XGnHD+ctQgDfmdHCQNQ+7QIvY8bjo3JyhBH/4fdWEv/N4T3x9UhrDyjaNHSnJTv8TpK9tLOBmwuVXB/EgnFx9YQxwnSUcmj69mYJAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
	dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/HO/x6devdd6+YjosteSm9fciE0iF7fXqKQYDx0tb4Y=;
	b=gok7cftFwI2e70/bVh9WxHPYrVllo3cI6XfAdGZCHv6dadn+x8jF6AUrfIF7+RmPiecc9zbYrX29vWtCYUeVw+FqqQqJh7d8FTd7AfIyWMLSgcYHWkix51cMcXZu0xF2b8VFNcNuEDT81s0iEZYduRovY5NhnuiKp6+BMiI1z0c=
Received: from MWHPR05MB3376.namprd05.prod.outlook.com (10.174.175.149) by
	MWHPR05MB2845.namprd05.prod.outlook.com (10.168.245.15) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.19; Tue, 12 Nov 2019 10:03:54 +0000
Received: from MWHPR05MB3376.namprd05.prod.outlook.com
	([fe80::4098:2c39:d8d3:a209]) by
	MWHPR05MB3376.namprd05.prod.outlook.com
	([fe80::4098:2c39:d8d3:a209%7]) with mapi id 15.20.2451.018;
	Tue, 12 Nov 2019 10:03:54 +0000
To: 'Stefano Garzarella' <sgarzare@redhat.com>
Subject: RE: [PATCH net-next 12/14] vsock/vmci: register vmci_transport only
	when VMCI guest/host are active
Thread-Topic: [PATCH net-next 12/14] vsock/vmci: register vmci_transport only
	when VMCI guest/host are active
Thread-Index: AQHViYhpRc2q1qJxVEORBsxH5VDhoaeGP/hggAAYgICAARRFEA==
Date: Tue, 12 Nov 2019 10:03:54 +0000
Message-ID: <MWHPR05MB33769FD52B833FC1C82F0A80DA770@MWHPR05MB3376.namprd05.prod.outlook.com>
References: <20191023095554.11340-1-sgarzare@redhat.com>
	<20191023095554.11340-13-sgarzare@redhat.com>
	<MWHPR05MB3376266BC6AE9E6E0B75F1A1DA740@MWHPR05MB3376.namprd05.prod.outlook.com>
	<20191111173053.erwfzawioxje635o@steredhat>
In-Reply-To: <20191111173053.erwfzawioxje635o@steredhat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhansen@vmware.com; 
x-originating-ip: [208.91.2.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6159e3f2-39bf-4964-e23d-08d76757a03c
x-ms-traffictypediagnostic: MWHPR05MB2845:
x-microsoft-antispam-prvs: <MWHPR05MB28454DC7E240204D86E8E465DA770@MWHPR05MB2845.namprd05.prod.outlook.com>
x-vmwhitelist: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(189003)(199004)(6246003)(3846002)(71190400001)(81166006)(6506007)(229853002)(99286004)(55016002)(71200400001)(8936002)(6116002)(14454004)(478600001)(86362001)(5660300002)(102836004)(74316002)(6916009)(9686003)(256004)(7736002)(7696005)(76176011)(305945005)(2906002)(446003)(11346002)(81156014)(316002)(6436002)(8676002)(476003)(76116006)(186003)(26005)(4326008)(66066001)(64756008)(33656002)(25786009)(66946007)(7416002)(54906003)(486006)(66556008)(52536014)(66476007)(66446008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR05MB2845;
	H:MWHPR05MB3376.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HJgnxj7auhSs7J3hUaOWmu8KPHlyh3ngMVp5Ojm+KAhvQM95+FhFf3ooVZ9jJUXqiuT/S2S/Vm5+xCrH8qJQ5JgysfPe4mFfrE1uj/el7QvKpoVjNgUSYTNrgzk8BWsqEhQHG15SYQB2IECmvUbeJvLp8rKh5rroofM53zyofH6aDqKZ7ZBlIbVVWqKNL/L6sypnYVtoqH4DwVVhRLGCbJpHaJqB5J5WHyvm/qNlkDHdU6bGdAf9hQ1zWDbVgHcHeI8zk0uasA8aKvJ00Dut2Qal36Veat0TLV1c0dkqi1qNf5vyxrxoqqrclrPmS93GedG6LatjCSRKAujCjMZx9cb/M2bPiAmmSEX+PaGKLYLlHCGjKjb/T6QtoPS7yjhdt6VliddvMqUjjboowGfnEWN8UzDGERCSsCnGtIpmrLtSMbzlVT5EsKU4tnIJ/vEy
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6159e3f2-39bf-4964-e23d-08d76757a03c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 10:03:54.3665 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZgmAGcx40hBwHqu5Rgy2uhRyi0wXYEv3NPQHQTYULODH+xp+L/NgValHWso993HglNgwiIalMEpm7wjvwkc1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR05MB2845
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
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
From: Jorgen Hansen via Virtualization
	<virtualization@lists.linux-foundation.org>
Reply-To: Jorgen Hansen <jhansen@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

> From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> Sent: Monday, November 11, 2019 6:31 PM
> On Mon, Nov 11, 2019 at 04:27:28PM +0000, Jorgen Hansen wrote:
> > > From: Stefano Garzarella [mailto:sgarzare@redhat.com]
> > > Sent: Wednesday, October 23, 2019 11:56 AM
> > >
> > > To allow other transports to be loaded with vmci_transport,
> > > we register the vmci_transport as G2H or H2G only when a VMCI guest
> > > or host is active.
> > >
> > > To do that, this patch adds a callback registered in the vmci driver
> > > that will be called when a new host or guest become active.
> > > This callback will register the vmci_transport in the VSOCK core.
> > > If the transport is already registered, we ignore the error coming
> > > from vsock_core_register().
> >
> > So today this is mainly an issue for the VMCI vsock transport, because
> > VMCI autoloads with vsock (and with this solution it can continue to
> > do that, so none of our old products break due to changed behavior,
> > which is great).
> 
> I tried to not break anything :-)
> 
> >                  Shouldn't vhost behave similar, so that any module
> > that registers a h2g transport only does so if it is in active use?
> >
> 
> The vhost-vsock module will load when the first hypervisor open
> /dev/vhost-vsock, so in theory, when there's at least one active user.

Ok, sounds good then. 

> 
> >
> > > --- a/drivers/misc/vmw_vmci/vmci_host.c
> > > +++ b/drivers/misc/vmw_vmci/vmci_host.c
> > > @@ -108,6 +108,11 @@ bool vmci_host_code_active(void)
> > >  	     atomic_read(&vmci_host_active_users) > 0);
> > >  }
> > >
> > > +int vmci_host_users(void)
> > > +{
> > > +	return atomic_read(&vmci_host_active_users);
> > > +}
> > > +
> > >  /*
> > >   * Called on open of /dev/vmci.
> > >   */
> > > @@ -338,6 +343,8 @@ static int vmci_host_do_init_context(struct
> > > vmci_host_dev *vmci_host_dev,
> > >  	vmci_host_dev->ct_type = VMCIOBJ_CONTEXT;
> > >  	atomic_inc(&vmci_host_active_users);
> > >
> > > +	vmci_call_vsock_callback(true);
> > > +
> >
> > Since we don't unregister the transport if user count drops back to 0, we
> could
> > just call this the first time, a VM is powered on after the module is loaded.
> 
> Yes, make sense. can I use the 'vmci_host_active_users' or is better to
> add a new 'vmci_host_vsock_loaded'?
> 
> My doubt is that vmci_host_active_users can return to 0, so when it returns
> to 1, we call vmci_call_vsock_callback() again.

vmci_host_active_users can drop to 0 and then increase again, so having a flag
indicating whether the callback has been invoked would ensure that it is only
called once.

Thanks,
Jorgen


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
