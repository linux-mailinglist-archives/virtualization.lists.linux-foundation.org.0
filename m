Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E19F56077
	for <lists.virtualization@lfdr.de>; Wed, 26 Jun 2019 05:48:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2F648D7D;
	Wed, 26 Jun 2019 03:48:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C98FFD3B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 03:48:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680046.outbound.protection.outlook.com [40.107.68.46])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2FDF7710
	for <virtualization@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 03:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=MipVIl/vK4jT6xfDxXZnl22+gCgO6Ner30cT/dH+FYA=;
	b=XC+xHE8mDv2cKU9kwuQMb6VQg0eKbWnjkIk5SsfB0kSFU6ULjTRlUEqFWgmQz7a3Q9kmvR/84s4vmm/7KHXrf1VEfLvCmLPxwYjh6pwTI5XdghYKz6BtechdSpjdRTe4tw0uOepeVhFRAbM9c820ZvwzV2NyforHfSAJ8DOR4Yg=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
	BYAPR05MB4918.namprd05.prod.outlook.com (52.135.235.160) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2008.13; Wed, 26 Jun 2019 03:48:49 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::f493:3bba:aabf:dd58]) by
	BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::f493:3bba:aabf:dd58%7]) with mapi id 15.20.2008.007;
	Wed, 26 Jun 2019 03:48:49 +0000
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 4/9] x86/mm/tlb: Flush remote and local TLBs concurrently
Thread-Topic: [PATCH 4/9] x86/mm/tlb: Flush remote and local TLBs concurrently
Thread-Index: AQHVIbQneqvfvnASJUSZoJZyXs9UlaatXWmAgAADTQA=
Date: Wed, 26 Jun 2019 03:48:49 +0000
Message-ID: <28C3D489-54E4-4670-B726-21B09FA469EE@vmware.com>
References: <20190613064813.8102-1-namit@vmware.com>
	<20190613064813.8102-5-namit@vmware.com>
	<CALCETrXyJ8y7PSqf+RmGKjM4VSLXmNEGi6K=Jzw4jmckRQECTg@mail.gmail.com>
In-Reply-To: <CALCETrXyJ8y7PSqf+RmGKjM4VSLXmNEGi6K=Jzw4jmckRQECTg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [204.134.128.110]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb2700b8-7c95-44a7-7ea3-08d6f9e932f9
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR05MB4918; 
x-ms-traffictypediagnostic: BYAPR05MB4918:
x-microsoft-antispam-prvs: <BYAPR05MB4918241570189A72A62A0AD6D0E20@BYAPR05MB4918.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(396003)(39860400002)(346002)(136003)(376002)(199004)(189003)(76116006)(102836004)(33656002)(91956017)(81156014)(76176011)(446003)(2616005)(316002)(11346002)(6486002)(73956011)(7736002)(6116002)(6916009)(36756003)(229853002)(54906003)(305945005)(66066001)(81166006)(66556008)(6506007)(8936002)(14454004)(7416002)(476003)(256004)(86362001)(4326008)(2906002)(53546011)(64756008)(6512007)(8676002)(26005)(6436002)(6246003)(4744005)(66946007)(71190400001)(66446008)(53936002)(186003)(25786009)(486006)(68736007)(478600001)(66476007)(71200400001)(3846002)(99286004)(5660300002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB4918;
	H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: my4KTkN3aqGXmWhsjfVVxjr2Sm5jxWwCaMIuqKK1SsSqfx8cHPx4n7R/9FEhekYtgpGmPoA2h6nrHG+Rz9L+JQsOqVLuwNvdEQaMWrCZP5qmj2mkG2t8zspoeNUHe6nCs4Y376EXS5L+59rbBaGcI7/Uh5HlOSRZEGrZdEiUA+DWcY+l2XlRv9JlVTF/g2eykA/66MtRJsOCSLrhfyecmaFOXkw9qYctXE2l1tb4y03sQ948HXUHOY4Sm2rNKOqk6IcdUuaYwgu2eYDCUjv3QsrQk85ptyza2hGIyDPYsJNr/D2fB3z+zk1AWlB0T9oDTOsQLCVM30dXJaJTr6JzyyuaVbSXADluDzrGIjHaSB+X+uG1sYe+/Oz6VFJpDdB7qrQQOhC59RFt//fXiwkrodWD5nTlq09DMzrcv+Fmdyo=
Content-ID: <E62AD8D44ED93F48AE881F9F9D2418DD@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2700b8-7c95-44a7-7ea3-08d6f9e932f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 03:48:49.6652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: namit@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB4918
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm list <kvm@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Haiyang Zhang <haiyangz@microsoft.com>, X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Virtualization <virtualization@lists.linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
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
From: Nadav Amit via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Nadav Amit <namit@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

> On Jun 25, 2019, at 8:36 PM, Andy Lutomirski <luto@kernel.org> wrote:
> 
> On Wed, Jun 12, 2019 at 11:49 PM Nadav Amit <namit@vmware.com> wrote:
>> To improve TLB shootdown performance, flush the remote and local TLBs
>> concurrently. Introduce flush_tlb_multi() that does so. The current
>> flush_tlb_others() interface is kept, since paravirtual interfaces need
>> to be adapted first before it can be removed. This is left for future
>> work. In such PV environments, TLB flushes are not performed, at this
>> time, concurrently.
> 
> Would it be straightforward to have a default PV flush_tlb_multi()
> that uses flush_tlb_others() under the hood?

I prefer not to have a default PV implementation that should anyhow go away.

I can create unoptimized untested versions for Xen and Hyper-V, if you want.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
