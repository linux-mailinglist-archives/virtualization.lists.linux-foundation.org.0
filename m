Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 407B594D11
	for <lists.virtualization@lfdr.de>; Mon, 19 Aug 2019 20:36:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7F14CE8E;
	Mon, 19 Aug 2019 18:36:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2FEE8B7D
	for <virtualization@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 18:36:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C66BA8A0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 19 Aug 2019 18:36:45 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2019 11:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,405,1559545200"; d="scan'208";a="195592515"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
	([10.54.74.41])
	by fmsmga001.fm.intel.com with ESMTP; 19 Aug 2019 11:36:44 -0700
Date: Mon, 19 Aug 2019 11:36:44 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Nicusor CITU <ncitu@bitdefender.com>
Subject: Re: [RFC PATCH v6 55/92] kvm: introspection: add KVMI_CONTROL_MSR
	and KVMI_EVENT_MSR
Message-ID: <20190819183643.GB1916@linux.intel.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-56-alazar@bitdefender.com>
	<20190812210501.GD1437@linux.intel.com>
	<f9e94e9649f072911cc20129c2b633747d5c1df5.camel@bitdefender.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9e94e9649f072911cc20129c2b633747d5c1df5.camel@bitdefender.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Samuel =?iso-8859-1?Q?Laur=E9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	"Zhang@vger.kernel.org" <Zhang@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	Adalbert =?utf-8?B?TGF6xINy?= <alazar@bitdefender.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Mihai =?utf-8?B?RG9uyJt1?= <mdontu@bitdefender.com>
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

On Thu, Aug 15, 2019 at 06:36:44AM +0000, Nicusor CITU wrote:
> > > +	void (*msr_intercept)(struct kvm_vcpu *vcpu, unsigned int msr,
> > > +				bool enable);
> > 
> > This should be toggle_wrmsr_intercept(), or toggle_msr_intercept()
> > with a paramter to control RDMSR vs. WRMSR.
> 
> Ok, I can do that.
> 
> 
> > > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > > index 6450c8c44771..0306c7ef3158 100644
> > > --- a/arch/x86/kvm/vmx/vmx.c
> > > +++ b/arch/x86/kvm/vmx/vmx.c
> > > @@ -7784,6 +7784,15 @@ static __exit void hardware_unsetup(void)
> > >  	free_kvm_area();
> > >  }
> > >  
> > > +static void vmx_msr_intercept(struct kvm_vcpu *vcpu, unsigned int
> > > msr,
> > > +			      bool enable)
> > > +{
> > > +	struct vcpu_vmx *vmx = to_vmx(vcpu);
> > > +	unsigned long *msr_bitmap = vmx->vmcs01.msr_bitmap;

Is KVMI intended to play nice with nested virtualization?  Unconditionally
updating vmcs01.msr_bitmap is correct regardless of whether the vCPU is in
L1 or L2, but if the vCPU is currently in L2 then the effective bitmap,
i.e. vmcs02.msr_bitmap, won't be updated until the next nested VM-Enter.

> > > +
> > > +	vmx_set_intercept_for_msr(msr_bitmap, msr, MSR_TYPE_W, enable);
> > > +}
> > 
> > Unless I overlooked a check, this will allow userspace to disable
> > WRMSR interception for any MSR in the above range, i.e. userspace can
> > use KVM to gain full write access to pretty much all the interesting
> > MSRs. This needs to only disable interception if KVM had interception
> > disabled before introspection started modifying state.
> 
> We only need to enable the MSR interception. We never disable it -
> please see kvmi_arch_cmd_control_msr().

In that case, drop @enable and use enable_wrmsr_intercept() or something
along those lines for kvm_x86_ops instead of toggle_wrmsr_intercept().
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
