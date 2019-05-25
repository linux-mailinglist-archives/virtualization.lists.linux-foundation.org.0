Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DC92A376
	for <lists.virtualization@lfdr.de>; Sat, 25 May 2019 10:38:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BD8EFDBC;
	Sat, 25 May 2019 08:38:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9029CDB1
	for <virtualization@lists.linux-foundation.org>;
	Sat, 25 May 2019 08:38:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680056.outbound.protection.outlook.com [40.107.68.56])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DA3CF81A
	for <virtualization@lists.linux-foundation.org>;
	Sat, 25 May 2019 08:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=r6J2DvToHqUoKJMZU5ckrb26c5lekjhb7vISkynKHyI=;
	b=KExin2AMte4c/j7+rFNWbofR0BeuSUpBWbQDy6w+XHknTeULNVIPux87gv+iYLDZ/oN2OHErnPVp4LlTZ7pLfmVEL+my2NfdGmegE6nVyiqGtdO2NPMkq7AKSVSHMgkPG+mu/GHApqF3ySrNqj76N56MGThU5AK01GXqk0co0Mg=
Received: from BYAPR05MB4776.namprd05.prod.outlook.com (52.135.233.146) by
	BYAPR05MB4615.namprd05.prod.outlook.com (52.135.233.24) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1922.13; Sat, 25 May 2019 08:38:06 +0000
Received: from BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::2cb6:a3d1:f675:ced8]) by
	BYAPR05MB4776.namprd05.prod.outlook.com
	([fe80::2cb6:a3d1:f675:ced8%3]) with mapi id 15.20.1943.007;
	Sat, 25 May 2019 08:38:06 +0000
To: Nadav Amit <namit@vmware.com>
Subject: Re: [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local TLBs
	concurrently
Thread-Topic: [RFC PATCH 5/6] x86/mm/tlb: Flush remote and local TLBs
	concurrently
Thread-Index: AQHVEtL3brMxLnyQKEm7V/vFcW9jOKZ7hLGA
Date: Sat, 25 May 2019 08:38:05 +0000
Message-ID: <F9875905-7383-4815-B6F6-B3EA73B7BF3F@vmware.com>
References: <20190525082203.6531-1-namit@vmware.com>
	<20190525082203.6531-6-namit@vmware.com>
In-Reply-To: <20190525082203.6531-6-namit@vmware.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=namit@vmware.com; 
x-originating-ip: [2601:647:4580:b719:c833:b364:6fe3:b42b]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0ecb8eb-24df-456a-89f4-08d6e0ec4eed
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:BYAPR05MB4615; 
x-ms-traffictypediagnostic: BYAPR05MB4615:
x-microsoft-antispam-prvs: <BYAPR05MB461521666233A75FC7AA838CD0030@BYAPR05MB4615.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0048BCF4DA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(366004)(396003)(136003)(346002)(376002)(199004)(189003)(82746002)(99286004)(229853002)(66556008)(64756008)(66446008)(73956011)(66476007)(66946007)(25786009)(53546011)(54906003)(14444005)(14454004)(256004)(6200100001)(37006003)(8936002)(81166006)(81156014)(6506007)(8676002)(7416002)(33656002)(6436002)(76176011)(86362001)(76116006)(305945005)(7736002)(316002)(478600001)(6512007)(486006)(6486002)(476003)(5660300002)(446003)(6862004)(46003)(11346002)(36756003)(4744005)(2616005)(6246003)(2906002)(53936002)(4326008)(186003)(102836004)(6116002)(71200400001)(71190400001)(68736007)(83716004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR05MB4615;
	H:BYAPR05MB4776.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +MzpgiAwJJ1Y0+54CC/xVsiJ4fsLrUc+V0z0BaUwSLpHi6Mi7JLHsskn5Gv3BeLeI8Wb/WhcQ0SOfBPPg1IVALSCW1hImG0HugvyeMPmYwW98wqjf87+iqYUo5egeAHCsNnguUht6k8YuhR7IEcZbiOlQdMlJJmDC90xta/NvEyAWOxp796E841P/hJHBnIaFUGfF8cHkUCb5uWt91nCE7mRNboQUIOO9f1ZW3VgN6/DoRvnHdQgV613iTDauyBS61xGRtOJJv9qT9Bjq5+1Q4JLhCKtsv+4u07av/oXlRbgQAnrJoJeIXgV39kO12HScwXMTHEPHlkARtAubi+1xPaeXzCqvsx0pwkF1epyppKLH0xf9k65U2hqZgxUt3o32n7X4a3R4i8mUKJbZZTD8VyXBka88JwTe1snJxBmMuA=
Content-ID: <75106B379062644D9E12CC0F943F0E87@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0ecb8eb-24df-456a-89f4-08d6e0ec4eed
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2019 08:38:05.9608 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: namit@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB4615
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Haiyang Zhang <haiyangz@microsoft.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
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

> On May 25, 2019, at 1:22 AM, Nadav Amit <namit@vmware.com> wrote:
> 
> To improve TLB shootdown performance, flush the remote and local TLBs
> concurrently. Introduce flush_tlb_multi() that does so. The current
> flush_tlb_others() interface is kept, since paravirtual interfaces need
> to be adapted first before it can be removed. This is left for future
> work. In such PV environments, TLB flushes are not performed, at this
> time, concurrently.
> 
> +void native_flush_tlb_multi(const struct cpumask *cpumask,
> +			    const struct flush_tlb_info *info)
> {
> +	/*
> +	 * native_flush_tlb_multi() can handle a single CPU, but it is
> +	 * suboptimal if the local TLB should be flushed, and therefore should
> +	 * not be used in such case. Check that it is not used in such case,
> +	 * and use this assumption for tracing and accounting of remote TLB
> +	 * flushes.
> +	 */
> +	VM_WARN_ON(!cpumask_any_but(cpumask, smp_processor_id()));

This warning might fire off incorrectly and will be removed.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
